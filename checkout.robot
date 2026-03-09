*** Settings ***
Library    Selenium2Library
Library    Collections
Library    String
Resource    Login_keywords.robot

*** Test Cases ***

Checkout validation
    Login with standard user
    Page Should Contain Element    id: shopping_cart_container
    Click Element    //*[@id="item_4_title_link"]/div
    Click Button    //*[@id="add-to-cart"]
    Click Element    //*[@id="shopping_cart_container"]/a
    Page Should Contain    Your Cart
    Click Button    //*[@id="checkout"]
    Page Should Contain    Checkout: Your Information
    Input Text    //*[@id="last-name"]    abc
    Sleep    1s
    Input Text    //*[@id="postal-code"]    6100
    Sleep    1s
    Click Element    //*[@id="continue"]
    Sleep    1s
    Page Should Contain Element    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Element Text Should Be    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3    Error: First Name is required
    Reload Page
    Input Text    //*[@id="first-name"]    yxz
    Sleep    1s
    Input Text    //*[@id="postal-code"]    6100
    Sleep    1s
    Click Element    //*[@id="continue"]
    Page Should Contain Element   //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Element Text Should Be    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3    Error: Last Name is required
    Reload Page
    Input Text    //*[@id="first-name"]    yxz
    Sleep    1s
    Input Text    //*[@id="last-name"]    abc
    Sleep    1s
    Click Element    //*[@id="continue"]
    Sleep    1s
    Page Should Contain Element   //*[@id="checkout_info_container"]/div/form/div[1]/div[4]
    Element Text Should Be    //*[@id="checkout_info_container"]/div/form/div[1]/div[4]/h3    Error: Postal Code is required
    Reload Page
    Input Text    //*[@id="first-name"]    xyz
    Sleep    1s
    Input Text    //*[@id="last-name"]    abc
    Sleep    1s
    Input Text    //*[@id="postal-code"]    6100
    Sleep    1s
    Click Element    //*[@id="continue"]
    Sleep    1s
    Page Should Contain    Checkout: Overview
    Click Button    //*[@id="cancel"]
    Page Should Contain Element    //*[@id="header_container"]/div[2]/div/span/select
    Sleep    2s
    Close Browser