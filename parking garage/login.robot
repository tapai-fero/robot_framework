*** Settings ***
Library    Selenium2Library

*** Keywords ***
Registration
    Open Browser    https://parking-garage-app.netlify.app    browser=Firefox
    Click Element    //*[@id="register-link"]
    Page Should Contain Button    //*[@id="register-button"]
    Input Text    //*[@id="firstName"]    nemtom
    Input Text    //*[@id="lastName"]    ezt se
    Input Text    //*[@id="phoneNumber"]    +36001234567
    Input Text    //*[@id="email"]    hablabla@blub.fih
    Input Password    //*[@id="password"]    halacska
    Input Password    //*[@id="confirmPassword"]    halacska
    Click Button    //*[@id="register-button"]


Login with registrated user
    Open Browser    https://parking-garage-app.netlify.app    browser=Firefox
    Click Element    //*[@id="register-link"]
    Page Should Contain Button    //*[@id="register-button"]
    Input Text    //*[@id="firstName"]    nemtom
    Input Text    //*[@id="lastName"]    ezt se
    Input Text    //*[@id="phoneNumber"]    +36001234567
    Input Text    //*[@id="email"]    hablabla@blub.fih
    Input Password    //*[@id="password"]    halacska
    Input Password    //*[@id="confirmPassword"]    halacska
    Click Button    //*[@id="register-button"]
    Sleep    1s
    Click Element    //*[@id="login-link"]
    Page Should Contain Button    //*[@id="login-button"]
    Input Text    //*[@id="email"]    hablabla@blub.fih
    Input Password    //*[@id="password"]    halacska
    Click Button    //*[@id="login-button"]

*** Test Cases ***
        
Login
    Login with registrated user
    Wait Until Element Is Visible    class:logout-button
    Click Button    class:logout-button
    Sleep    5s
    Close Browser

Login with invalid credentials
    Registration
    Click Element    //*[@id="login-link"]
    Input Text    //*[@id="email"]    hablabla@blub.fih
    Input Password    //*[@id="password"]    halacsk
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Page Should Contain    Invalid email or password.
    Reload Page
    Input Text    //*[@id="email"]    blublub@halacska.hal
    Input Password    //*[@id="password"]    halacska
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Page Should Contain    Invalid email or password.
    Reload Page
    Click Button    //*[@id="login-button"]
    Sleep    2s
    Page Should Contain Textfield    //*[@id="email"]    Kérjük, töltse ki ezt a mezőt
    Sleep    5s
    Close Browser

