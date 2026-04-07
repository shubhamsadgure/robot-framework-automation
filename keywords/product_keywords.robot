*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot
Resource    ../pages/product_page.robot

*** Keywords ***
Validate Swag Labs Title
    Log To Console    Validating the Swag Labs Title
    ${title}=    Get Title
    Should Be Equal As Strings    ${title}    ${VALIDATE_TITLE_MSG}


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
