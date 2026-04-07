*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot
Resource    ../pages/cart_page.robot



*** Keywords ***

Validate Products In Cart
    Log To Console    Validating the products in the cart
    Page Should Contain    ${PRODUCT_1}
    Page Should Contain    ${PRODUCT_2}


Click Checkout Button
    Log To Console    Cliking On The check box button
    Scroll Element Into View            ${Click_On_Check_Out}
    Click Element                       ${Click_On_Check_Out}
