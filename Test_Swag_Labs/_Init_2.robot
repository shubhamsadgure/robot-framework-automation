*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/Keywords.robot
Resource    ../pages/SwagLabPage.robot


Test Setup    Run Keywords    Open Login Page    AND    Login With User
Test Teardown    Close Browser