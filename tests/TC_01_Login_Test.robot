*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/Keywords.robot



*** Test Cases ***
Test Dashboard Page
    [Tags]      smoke
    Page Should Contain    CRM
