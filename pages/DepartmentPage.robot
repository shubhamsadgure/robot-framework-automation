*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${HAMBURGER}              xpath://div[@id='hamburgerTrigger']
${SYSTEM_CONFIG}          xpath://span[normalize-space()='System Configuration']
${MANAGE_DEPARTMENT}      xpath://a[normalize-space()='Manage Department']
${ADD_DEPARTMENT}         xpath://a[normalize-space()='Add Department']
${ENTER_DEPARTMENT_NAME}  xpath://input[@id='department_name']
${STATUS_CHECKBOX}        id:filled-in-box-status1
${SUBMIT_BUTTON}          xpath://button[normalize-space()='Submit']
${PAGE_HEADER_TEXT}       xpath://span[@class='page-header-text']
${SEARCH_BY_LISTING_BY}   xpath://select[@id='search_status']
${ENTER_DEPARTMENT_SEARCH}    id:search_value
${SEARCH_BUTTON}          xpath://button[normalize-space()='Search']
${DEPARTMENT_NAME_TABLE}  xpath://table[@id='example']//tr[1]/td[2]
${EDIT_DEPARTMENT}        xpath://table[@id='example']//tr[1]/td[8]//i[contains(@class,'fa-pen')]


*** Keywords ***
Initialize Test Data
    ${random}=        Generate Random String    4    [LETTERS]
    ${dept_name}=     Set Variable    HRDept${random}
    Set Suite Variable    ${dept_name}

    ${random}=        Generate Random String    4    [LETTERS]
    ${Update_dept_name}=     Set Variable    HRDept${random}
    Set Suite Variable    ${Update_dept_name}


Navigate To Add Department Page
    Wait Until Element Is Visible    ${HAMBURGER}    10s
    Click Element    ${HAMBURGER}

    Wait Until Element Is Visible    ${SYSTEM_CONFIG}    10s
    Click Element    ${SYSTEM_CONFIG}

    Wait Until Element Is Visible    ${MANAGE_DEPARTMENT}    10s
    Click Element    ${MANAGE_DEPARTMENT}

    Wait Until Element Is Visible    ${ADD_DEPARTMENT}    10s
    Click Element    ${ADD_DEPARTMENT}



Create New Department
    Wait Until Element Is Visible    ${ENTER_DEPARTMENT_NAME}    10s
    Input Text    ${ENTER_DEPARTMENT_NAME}    ${dept_name}

    Wait Until Element Is Enabled    ${STATUS_CHECKBOX}    10s
    Click Element    ${STATUS_CHECKBOX}

    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    10s
    Click Button    ${SUBMIT_BUTTON}

    Wait Until Page Contains    Department added successfully    5s
    Log To Console    Department added successfully
    Sleep    4sec


Search Department
    Wait Until Element Is Visible    ${SEARCH_BY_LISTING_BY}    10s
    Select From List By Value    ${SEARCH_BY_LISTING_BY}    dept_name

    Wait Until Element Is Visible    ${ENTER_DEPARTMENT_SEARCH}    10s
    Input Text    ${ENTER_DEPARTMENT_SEARCH}    ${dept_name}

    Wait Until Element Is Visible    ${SEARCH_BUTTON}    10s
    Click Button    ${SEARCH_BUTTON}

    Wait Until Element Is Visible    ${DEPARTMENT_NAME_TABLE}    10s
    ${Actual_Name}=    Get Text    ${DEPARTMENT_NAME_TABLE}
    Sleep    2s
    Should Be Equal    ${Actual_Name}    ${dept_name}
    Log To Console    Actual: ${Actual_Name} | Expected: ${dept_name}


Edit Department
    Wait Until Element Is Visible    ${EDIT_DEPARTMENT}    10s
    Click Element    ${EDIT_DEPARTMENT}


Update Department
    Wait Until Element Is Visible    ${ENTER_DEPARTMENT_NAME}    10s
    Input Text    ${ENTER_DEPARTMENT_NAME}    ${Update_dept_name}

    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    10s
    Click Button    ${SUBMIT_BUTTON}

    Wait Until Page Contains    Department updated successfully    5s
    Log To Console    Department updated successfully
    Sleep    4sec



