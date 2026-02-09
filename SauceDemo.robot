*** Settings ***
Library    Selenium2Library

*** Test Cases ***

#Open saucedemo webpage
#    Open Browser    https://www.saucedemo.com/    browser=Chrome
#    Close Browser

Login with valid credentials
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Page Should Contain Element    id: shopping_cart_container
    Sleep    2s
    Close Browser

Login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    standard_user
    Input Password    id:password    secret_sauc
    Click Button    id:login-button
    Page Should Contain Element    class:error-message-container
    Page Should Contain    Username and password do not match any user in this service
    Sleep    2s
    Close Browser

Login with wrong username and valid password
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    standard
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Page Should Contain Element    class:error-message-container
    Page Should Contain    Username and password do not match any user in this service
    Sleep    2s
    Close Browser

Login without username
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Password    id:password    secret_sauce
    Click Button    id:login-button
    Page Should Contain Element    class:error-message-container
    Page Should Contain    Username is required
    Sleep    2s
    Close Browser

Login without password
    Open Browser    https://www.saucedemo.com/    browser=Chrome
    Input Text    id:user-name    standard_user
    Click Button    id:login-button
    Page Should Contain Element    class:error-message-container
    Page Should Contain    Password is required
    Sleep    2s
    Close Browser