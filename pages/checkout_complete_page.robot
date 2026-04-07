*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot

*** Variables ***
${Get Thank for you order Text}     xpath://h2[normalize-space()='Thank you for your order!']