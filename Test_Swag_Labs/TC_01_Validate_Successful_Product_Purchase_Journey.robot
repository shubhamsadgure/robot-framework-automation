*** Settings ***
Library    SeleniumLibrary
#Resource    ../pages/SwagLabPage.robot
Resource    ../keywords/product_keywords.robot
Resource    ../keywords/checkout_complete_keywords.robot
Resource    ../keywords/checkout_information_keywords.robot
Resource    ../keywords/checkout_overview_keywords.robot
Resource    ../keywords/cart_keywords.robot



*** Test Cases ***
Validate Successful Product Purchase Journey
    [Tags]    smoke    regression
    Validate Swag Labs Title
    Add Bolt TShirt To Cart
    Add Fleece Jacket To Cart
    Open Shopping Cart
    Validate Products In Cart
    Click Checkout Button
    Enter Checkout Details
    Click Continue Button
    Verify Total Price Should Be Greater Than Sum Of Items
    Click On Finish
    Verify Thank You Message
