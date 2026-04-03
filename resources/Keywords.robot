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

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    #Call Method    ${options}    add_argument    "--window-size=1920,1080"


    Open Browser    ${url}    ${browser}    options=${options}
    Maximize Browser Window

    Login To Application    ${username}    ${password}