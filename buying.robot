*** Settings ***
Library    Selenium2Library

*** Test Cases ***

Login with valid credentials and buying an item succesfully
    Open Browser    https://www.saucedemo.com/    browser=Firefox
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Page Should Contain Element    id: shopping_cart_container
    Click Element    //*[@id="item_4_title_link"]/div
    Page Should Contain    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
    Click Button    //*[@id="add-to-cart"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Page Should Contain    Your Cart
    Click Button    //*[@id="checkout"]
    Page Should Contain    Checkout: Your Information
    Input Text    //*[@id="first-name"]    xyz
    Sleep    2s
    Input Text    //*[@id="last-name"]    abc
    Sleep    2s
    Input Text    //*[@id="postal-code"]    6100
    Sleep    2s
    Click Element    //*[@id="continue"]
    Page Should Contain    Checkout: Overview
    Click Button    //*[@id="finish"]
    Page Should Contain    Thank you for your order!
    Sleep    2s
    Close Browser