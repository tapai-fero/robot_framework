*** Settings ***
Library    Selenium2Library
Library    Collections
Library    String
Resource    Login_keywords.robot

*** Test Cases ***

Opening products
    Login with standard user
    ${item_name}=    Get Text    //*[@id="item_4_title_link"]/div
    ${item_desc}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div
    ${item_price}=    Get Text    //*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
    Click Element    //*[@id="item_4_title_link"]/div
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${item_name}    
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]    ${item_desc}
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]    ${item_price}
    Click Button    //*[@id="back-to-products"]
    Click Image    //*[@id="item_4_img_link"]/img
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${item_name}    
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[2]    ${item_desc}
    Element Text Should Be    //*[@id="inventory_item_container"]/div/div/div[2]/div[3]    ${item_price}
    ${url}=    Get Location
    Log    URL is ${url}