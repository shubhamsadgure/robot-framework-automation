*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot


*** Keywords ***

Verify Thank You Message
    Log To Console    Verifying the Thank You Message
    Page Should Contain    ${THANK_YOU_MESSAGE}