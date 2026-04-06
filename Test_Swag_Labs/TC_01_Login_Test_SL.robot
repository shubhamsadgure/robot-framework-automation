*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/SwagLabPage.robot


Test Setup    Run Keywords    Open Login Page    AND    Login With User
Test Teardown    Close Browser


*** Test Cases ***
Validate Successful Product Purchase Journey
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
