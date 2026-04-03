*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
#Customer Search Criteria

${lOAN_ACCOUNT_NUMBER_DASH}      id:lan
${MOBILE_NUMBER_DASH}            id:mobile
${VHEICLE_NUMBER_DASH}           id:vehicleNo
${SERCH_BTN_CUST_SEARCH_DASH}    id:search-btn

${SEARCH_RESULT_TABLE}          xpath://table[@id='customerListing']

*** Keywords ***
Enter LAN Number
    [Arguments]     ${lan}
    Wait Until Element Is Visible    ${lOAN_ACCOUNT_NUMBER_DASH}    10s
    Input Text    ${lOAN_ACCOUNT_NUMBER_DASH}    ${lan}

Enter Mobile Number
    [Arguments]     ${MobileNumber}
    Wait Until Element Is Visible    ${MOBILE_NUMBER_DASH}    10s
    Input Text    ${MOBILE_NUMBER_DASH}    ${MobileNumber}

Enter Vehicle Number
    [Arguments]     ${VheNumber}
    Wait Until Element Is Visible    ${VHEICLE_NUMBER_DASH}    10s
    Input Text    ${VHEICLE_NUMBER_DASH}    ${VheNumber}

Click on Search Button
    Wait Until Element Is Enabled    ${SERCH_BTN_CUST_SEARCH_DASH}    10s
    Click Button    ${SERCH_BTN_CUST_SEARCH_DASH}

The searched LAN customer is displayed
    [Arguments]     ${name}
    Wait Until Element Is Visible    ${SEARCH_RESULT_TABLE}    10s
    Wait Until Element Is Visible    ${SEARCH_RESULT_TABLE}//tr[1]/td[2]    10s
    ${actual_name}=    Get Text    ${SEARCH_RESULT_TABLE}//tr[1]/td[2]
    Should Be Equal As Strings    ${actual_name.strip()}    ${name.strip()}

No data available message should be displayed
    Wait Until Element Is Visible    ${SEARCH_RESULT_TABLE}    10s
    Wait Until Element Is Visible    xpath://td[@class='dataTables_empty']    10s
    ${actual_text}=    Get Text    xpath://td[@class='dataTables_empty']
    Should Be Equal As Strings    ${actual_text.strip()}    No data available in table