*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}    name=username
${PASSWORD_FIELD}    name=password
${LOGIN_BUTTON}      xpath=//button[normalize-space()='LOGIN']

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Password    ${PASSWORD_FIELD}    ${password}

Click Login
    Click Button    ${LOGIN_BUTTON}

Login To Application
    [Arguments]    ${username}    ${password}
    Enter Username    ${username}
    Enter Password    ${password}
    Click Login