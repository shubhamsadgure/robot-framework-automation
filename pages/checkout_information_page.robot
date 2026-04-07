*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot

*** Variables ***
${First_Name}               id:first-name
${Last_Name}                id:last-name
${Zip_Code}                 id:postal-code


${Clik_Continue}            id:continue
