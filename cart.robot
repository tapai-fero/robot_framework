*** Settings ***
Library    Selenium2Library

*** Keywords ***
Login to Saucedemo main page
    Open Browser    https://www.saucedemo.com/    browser=Firefox
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button


*** Test Cases ***

Add multiple products
    Login to Saucedemo main page
    Click Element    id:add-to-cart-sauce-labs-backpack
    Click Element    id:add-to-cart-sauce-labs-bike-light
    Click Element    id:add-to-cart-sauce-labs-bolt-t-shirt
    Element Text Should Be    class:shopping_cart_badge    3
    Click Element    id:shopping_cart_badge
    ${item_count}=    Get Element Count    class:cart_item
    Should Be Equal As Integers    ${item_count}    3
    Page Should Contain    Sauce Labs Backpack
    Page Should Contain    Sauce Labs Bike Light
    Page Should Contain    Sauce Labs Bolt T-shirt
    Sleep    2s
    Close Browser  