*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot
Resource    ../pages/login_page.robot


*** Keywords ***
Open Login Page
    Log To Console    Opening the Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")

    #  Disable password manager completely
    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=False
    ...    profile.password_manager_enabled=False
    ...    safebrowsing.enabled=False

    Evaluate    $options.add_experimental_option("prefs", ${prefs})

    #  Additional Chrome flags (VERY IMPORTANT)
    Evaluate    $options.add_argument("--disable-notifications")
    Evaluate    $options.add_argument("--disable-save-password-bubble")
    Evaluate    $options.add_argument("--disable-infobars")
    Evaluate    $options.add_argument("--incognito")

    Open Browser    ${URL}    chrome    options=${options}
    #Set Selenium Timeout    30s
    Set Selenium Implicit Wait      10s

Get All Usernames
    Log To Console    Getting the usernames
    ${text}=    Get Text    ${LOGIN_CREDENTIALS}
    @{users}=   Split To Lines    ${text}
    @{users}=   Get Slice From List    ${users}    1
    @{users}=   Remove Values From List    ${users}    ${EMPTY}
    RETURN    @{users}

Get Password From UI
    Log To Console    Getting the password
    ${text}=    Get Text    ${LOGIN_PASSWORD}
    @{lines}=   Split To Lines    ${text}
    ${password}=    Get From List    ${lines}    -1
    ${password}=    Strip String    ${password}
    RETURN    ${password}


Login With Credentials
    Log To Console    Loging with the credentials
    [Arguments]    ${username}    ${password}
    Input Text        ${USERNAME_INPUT}    ${username}
    Input Password    ${PASSWORD_INPUT}    ${password}
    Click Button      ${LOGIN_BUTTON}

Login With Random User
    Log To Console    Loging with the random user
    @{users}=       Get All Usernames
    ${password}=    Get Password From UI
    ${index}=    Evaluate    random.randint(0, len(${users})-1)    random
    ${user}=     Get From List    ${users}    ${index}
    Log    Using random user: ${user}
    Login With Credentials    ${user}    ${password}


Login With First User
    Log To Console    Loging with first user
    @{users}=       Get All Usernames
    ${password}=    Get Password From UI
    ${user}=    Get From List    ${users}    0
    Log    Using first user: ${user}
    Login With Credentials    ${user}    ${password}


Reset To Login Page
    Log To Console    Reseting the login page
    Go To    ${URL}
    Wait Until Element Is Visible    ${USERNAME_INPUT}


Get Standard User
    Log To Console    Getting the user
    @{users}=    Get All Usernames

    FOR    ${user}    IN    @{users}
        ${user}=    Strip String    ${user}
        IF    '${user}' == 'standard_user'
            RETURN    ${user}
        END
    END

    Fail    standard_user not found in UI list

Login With User
    Log To Console    Logging with user
    ${user}=        Get Standard User
    ${password}=    Get Password From UI
    Log    Using standard user: ${user}
    Login With Credentials    ${user}    ${password}