*** Settings ***
Library    Selenium2Library
Library    Collections
Library    String
Resource    Login_keywords.robot

*** Test Cases ***

Sort products Z to A
    Login with standard user
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[2]
    ${product_names}=    Get all products
    Verify Z to A sorting    ${product_names}
    
    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[1]
    ${product_names}=    Get all products
    Verify A to Z sorting    ${product_names}

    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[3]
    ${product_prices}=    Get all prices
    Verify low to high sorting    ${product_prices}

    Click Element    class:product_sort_container
    Click Element    //*[@id="header_container"]/div[2]/div/span/select/option[4]
    ${product_prices}=    Get all prices
    Verify high to low sorting    ${product_prices}

*** Keywords ***
Get all products
    ${products}=    Create List
    @{product_elements}=    Get WebElements    class:inventory_item_name
    FOR    ${element}    IN    @{product_elements}
        ${product_name}=    Get Text    ${element}
        Append To List    ${products}    ${product_name}
    END
    RETURN    @{products}

Get all prices
    ${prices}=    Create List
    @{price_elements}=    Get WebElements    class:inventory_item_price
    FOR    ${element}    IN    @{price_elements}
        ${product_price_with$}=    Get Text    ${element}
        ${product_price}=    Replace String       ${product_price_with$}    $     ${EMPTY}
        Append To List    ${prices}    ${product_price}
    END
    RETURN    @{prices}

Verify Z to A sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_names}    ${i}
        ${next}    Get From List    ${product_names}    ${i+1}
        Should Be True    '${current}' >= '${next}'    Product not in Z to A order ${current} < ${next}
    END

Verify A to Z sorting
    [Arguments]    ${product_names}
    ${length}=    Get Length    ${product_names}
    FOR    ${i}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_names}    ${i}
        ${next}    Get From List    ${product_names}    ${i+1}
        Should Be True    '${current}' <= '${next}'    Product not in A to Z order ${current} > ${next}
    END

Verify low to high sorting
    [Arguments]    ${product_prices}
    ${length}=    Get Length    ${product_prices}
    FOR    ${i}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_prices}    ${i}
        ${next}    Get From List    ${product_prices}    ${i+1}
        Should Be True    ${current} <= ${next}    Product not in low to high order ${current} > ${next}
    END

Verify high to low sorting
    [Arguments]    ${product_prices}
    ${length}=    Get Length    ${product_prices}
    FOR    ${i}    IN RANGE    0    ${length}-1
        ${current}    Get From List    ${product_prices}    ${i}
        ${next}    Get From List    ${product_prices}    ${i+1}
        Should Be True    ${current} >= ${next}    Product not in high to low order ${current} < ${next}
    END