*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/config_reader.py
Resource   ../pages/LoginPage.robot

*** Keywords ***
Open Browser And Login
    ${url}=        Get Config    url
    ${username}=   Get Config    username
    ${password}=   Get Config    password
    ${browser}=    Get Config    browser

    Open Browser    ${url}    ${browser}
    Maximize Browser Window

    Login To A pplication    ${username}    ${password}