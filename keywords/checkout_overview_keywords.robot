*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot
Resource    ../pages/checkout_overview_page.robot



*** Keywords ***
Verify Total Price Should Be Greater Than Sum Of Items
    Log To Console    Verifying the total price should be greater than sum of items

    Mouse Over    ${Item_Price1}
    ${price1_text}=    Get Text    ${Item_Price1}

    Mouse Over    ${Item_Price2}
    ${price2_text}=    Get Text    ${Item_Price2}

    Mouse Over    xpath=//div[@class='summary_total_label']
    ${total_text}=     Get Text    ${Total_Price}

    ${price1}=    Evaluate    float('${price1_text}'.replace('$',''))
    ${price2}=    Evaluate    float('${price2_text}'.replace('$',''))
    ${total}=     Evaluate    float('${total_text}'.replace('Total: $',''))

    ${sum}=       Evaluate    ${price1} + ${price2}

    Should Be True    ${total} > ${sum}


Click On Finish
    Log To Console    Clicking on finish button
    Scroll Element Into View         ${Click_On_Finish}
    Click Button                     ${Click_On_Finish}