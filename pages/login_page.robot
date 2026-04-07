*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot

*** Variables ***
${URL}                    ${URL}
${BROWSER}               ${BROWSER}

${USERNAME_INPUT}        id:user-name
${PASSWORD_INPUT}        id:password
${LOGIN_BUTTON}          id:login-button

${LOGIN_CREDENTIALS}     id:login_credentials
${LOGIN_PASSWORD}        xpath://div[@data-test='login-password']