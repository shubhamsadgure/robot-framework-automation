*** Settings ***
Library    SeleniumLibrary

Resource    ../keywords/login_keywords.robot


Suite Setup    Run Keywords    Open Login Page    AND    Login With User
Suite Teardown    Close Browser
