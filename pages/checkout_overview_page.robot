*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource    ../test_data/test_data.robot

*** Variables ***

${Item_Price1}               xpath:(//div[@data-test='inventory-item-price' and contains(text(),'$')])[1]
${Item_Price2}               xpath:(//div[@data-test='inventory-item-price' and contains(text(),'$')])[2]
${Total_Price}               xpath://div[@class='summary_total_label']

${Click_On_Finish}           id:finish
