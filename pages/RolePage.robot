*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
# Navigation
${HAMBURGER}        xpath://div[@id='hamburgerTrigger']
${SYSTEM_CONFIG}    xpath://span[normalize-space()='System Configuration']
${MANAGE_ROLE}      xpath://a[normalize-space()='Manage Role']
${ADD_ROLE}         xpath://a[normalize-space()='Add Role']

# Create Role
${DEPT_DROPDOWN}    name:dept_name
${ROLE}        xpath://input[@id='role_name']
${IS_ACTIVE}        xpath://input[@id='is_active']
${FEATURE_DROPDOWN}      id:feature
${SECTION_CHECKBOX}      name:sectionname[]
${ADD_BTN}          xpath://button[normalize-space()='Add']
${SUBMIT_BTN}       id:submit-btn
${SUCCESS_MSG}      xpath://div[contains(@class,'alert-success')]

# Search
${SEARCH_TYPE}      id:search_status
${SEARCH_INPUT}     id:search_value
${SEARCH_BTN}       id:search_button
${TABLE_ROW}        xpath://table[@id='example']//tr

# Edit
${EDIT_ICON}        xpath://table[@id='example']//tr[1]/td[9]//i[@class='fas fa-pencil-alt']

*** Keywords ***
Navigate To Add Role Page
    Wait Until Element Is Visible    ${HAMBURGER}    10s
    Click Element    ${HAMBURGER}

    Wait Until Element Is Visible    ${SYSTEM_CONFIG}    10s
    Wait Until Element Is Enabled    ${SYSTEM_CONFIG}    10s
    Scroll Element Into View         ${SYSTEM_CONFIG}
    Click Element                    ${SYSTEM_CONFIG}
    Wait Until Element Is Visible    ${MANAGE_ROLE}    10s
    Click Element                    ${MANAGE_ROLE}

    Wait Until Element Is Visible    ${ADD_ROLE}    10s
    Click Element                    ${ADD_ROLE}

Create New Role
    Wait Until Element Is Visible    ${DEPT_DROPDOWN}    10s
    Select From List By Value        ${DEPT_DROPDOWN}    201

    ${random}=    Generate Random String    5
    ${role_name}=    Set Variable    Role_${random}

    Wait Until Element Is Visible    ${ROLE}    10s
    Input Text                       ${ROLE}    ${role_name}

    Wait Until Element Is Visible    ${IS_ACTIVE}    10s
    Click Element                    ${IS_ACTIVE}

    Wait Until Element Is Visible    ${FEATURE_DROPDOWN}    10s
    Select From List By Value        ${FEATURE_DROPDOWN}    24

    Wait Until Element Is Visible    ${SECTION_CHECKBOX}    10s
    Click Element                    ${SECTION_CHECKBOX}

    Wait Until Element Is Enabled    ${ADD_BTN}    10s
    Click Button                     ${ADD_BTN}

    Wait Until Element Is Enabled    ${SUBMIT_BTN}    10s
    Click Button                     ${SUBMIT_BTN}

    Wait Until Element Is Visible    ${SUCCESS_MSG}    10s
    Element Should Be Visible        ${SUCCESS_MSG}

   RETURN    ${role_name}

Search Role
    [Arguments]    ${role_name}

    Wait Until Element Is Visible    ${SEARCH_TYPE}    10s
    Select From List By Value        ${SEARCH_TYPE}    role_name

    Wait Until Element Is Visible    ${SEARCH_INPUT}    10s
    Input Text                       ${SEARCH_INPUT}    ${role_name}

    Wait Until Element Is Enabled    ${SEARCH_BTN}    10s
    Click Button                     ${SEARCH_BTN}

    Wait Until Element Is Visible    ${TABLE_ROW}    10s

Edit Role
    Wait Until Element Is Visible    ${EDIT_ICON}    10s
    Scroll Element Into View         ${EDIT_ICON}
    Click Element                    ${EDIT_ICON}

    Wait Until Element Is Visible    ${FEATURE_DROPDOWN}    10s
    Select From List By Value        ${FEATURE_DROPDOWN}    20

    Wait Until Element Is Visible    ${SECTION_CHECKBOX}    10s
    Click Element                    ${SECTION_CHECKBOX}

    Wait Until Element Is Enabled    ${ADD_BTN}    10s
    Click Button                     ${ADD_BTN}

    Wait Until Element Is Enabled    ${SUBMIT_BTN}    10s
    Click Button                     ${SUBMIT_BTN}

    Wait Until Element Is Visible    ${SUCCESS_MSG}    10s
    Element Should Be Visible        ${SUCCESS_MSG}