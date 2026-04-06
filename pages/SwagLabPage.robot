*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot

*** Variables ***
${URL}                    https://www.saucedemo.com/
${BROWSER}               chrome

${USERNAME_INPUT}        id:user-name
${PASSWORD_INPUT}        id:password
${LOGIN_BUTTON}          id:login-button

${LOGIN_CREDENTIALS}     id:login_credentials
${LOGIN_PASSWORD}        xpath://div[@data-test='login-password']

${Add_Cart_Bolt_TShirt_Button}      id:add-to-cart-sauce-labs-bolt-t-shirt
${Add_Cart_Fleece_Jacket_Button}    id:add-to-cart-sauce-labs-fleece-jacket

${Shopping_Cart_Link}       xpath://a[@class='shopping_cart_link']
${Click_On_Check_Out}       id:checkout

${First_Name}               id:first-name
${Last_Name}                id:last-name
${Zip_Code}                 id:postal-code

${Clik_Continue}            id:continue

${Item_Price1}               xpath:(//div[@data-test='inventory-item-price' and contains(text(),'$')])[1]
${Item_Price2}               xpath:(//div[@data-test='inventory-item-price' and contains(text(),'$')])[2]
${Total_Price}               xpath://div[@class='summary_total_label']

${Click_On_Finish}           id:finish


*** Keywords ***

Open Login Page
    Log To Console    Opening the Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver

    #Evaluate    $options.add_argument("--headless=new")
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
    Set Selenium Timeout    30s


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


Validate Swag Labs Title
    Log To Console    ${VALIDATE_TITLE_MSG}
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    Swag Labs


Add Bolt TShirt To Cart
    Log To Console    Adding bold T-shirt to cart
    Scroll Element Into View         ${Add_Cart_Bolt_TShirt_Button}
    Click Button                    ${Add_Cart_Bolt_TShirt_Button}

Add Fleece Jacket To Cart
    Log To Console    Adding Fleecr jacket to cart
    Scroll Element Into View         ${Add_Cart_Fleece_Jacket_Button}
    Click Button                    ${Add_Cart_Fleece_Jacket_Button}


Open Shopping Cart
    Log To Console    Opening the shopping cart
    Scroll Element Into View         ${Shopping_Cart_Link}
    Click Element                    ${Shopping_Cart_Link}

Validate Products In Cart
    Log To Console    Validating the products in the cart
    Page Should Contain    ${PRODUCT_1}
    Page Should Contain    ${PRODUCT_2}

Click Checkout Button
    Log To Console    Cliking On The check box button
    Scroll Element Into View            ${Click_On_Check_Out}
    Click Element                       ${Click_On_Check_Out}


Enter Checkout Details
    Log To Console    Entering the checkout details
    ${random}=    Generate Random String    4    [LETTERS]
    ${first}=    Set Variable    John${random}
    ${last}=     Set Variable    Doe${random}
    ${zip}=      Generate Random String    6    [NUMBERS]


    Clear Element Text               ${First_Name}
    Input Text                       ${First_Name}    ${first}


    Clear Element Text               ${Last_Name}
    Input Text                       ${Last_Name}    ${last}


    Clear Element Text               ${Zip_Code}
    Input Text                       ${Zip_Code}     ${zip}

    Log To Console    First: ${first}, Last: ${last}, Zip: ${zip}


Click Continue Button
    Log To Console    Clicking on the continue button
    Scroll Element Into View         ${Clik_Continue}
    Wait Until Keyword Succeeds      3x    2s    Click Element    ${Clik_Continue}


Verify Total Price Should Be Greater Than Sum Of Items
    Log To Console    Verifying the total price should be greater than sum of items

    Mouse Over    ${Item_Price1}
    ${price1_text}=    Get Text    ${Item_Price1}

    Mouse Over    ${Item_Price2}
    ${price2_text}=    Get Text    ${Item_Price2}

    Mouse Over    xpath=//div[@class='summary_total_label']
    ${total_text}=     Get Text    ${Total_Price}

    ${price1}=    Evaluate    float('${price1_text}'.replace('$',''))
    ${price2}=    Evaluate    float('${price2_text}'.replace('$',''))
    ${total}=     Evaluate    float('${total_text}'.replace('Total: $',''))

    ${sum}=       Evaluate    ${price1} + ${price2}

    Should Be True    ${total} > ${sum}


Click On Finish
    Log To Console    Clicking on finish button
    Scroll Element Into View         ${Click_On_Finish}
    Click Button                     ${Click_On_Finish}


Verify Thank You Message
    Log To Console    Verifying the Thank You Message
    Page Should Contain    ${THANK_YOU_MESSAGE}

