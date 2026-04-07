*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot
Resource    ../pages/checkout_information_page.robot



*** Keywords ***

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