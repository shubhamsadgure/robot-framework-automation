*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot


*** Variables ***
${Add_Cart_Bolt_TShirt_Button}      id:add-to-cart-sauce-labs-bolt-t-shirt
${Add_Cart_Fleece_Jacket_Button}    id:add-to-cart-sauce-labs-fleece-jacket
${Shopping_Cart_Link}       xpath://a[@class='shopping_cart_link']