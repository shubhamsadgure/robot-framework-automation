*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/SwagLabPage.robot


Suite Setup    Run Keywords    Open Login Page    AND    Login With User
Suite Teardown    Close Browser
