*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/DashboardPage.robot
Resource   ../resources/Keywords.robot

*** Variables ***
${lan}      BRMU2W000005004840
${mobile_number}    7768965593
${vehicle_number}   MH11CS7551
${customer_name}    Rahul Mahadev Gaikwad

${inv_lan}      BRMU2W000005004841
${inv_mobile_number}    7768965511
${inv_vehicle_number}   MH11CS7552


*** Test Cases ***
Test Customer Search Criteria
      [Tags]        smoke   regression      customer_search
      Enter LAN Number      ${lan}
      Enter Mobile Number   ${mobile_number}
      Enter Vehicle Number  ${vehicle_number}
      click on Search Button
      The searched LAN customer is displayed    ${customer_name}


Test Customer Search Criteria by Entering Invalid Data
       [Tags]        smoke   regression      customer_search_invalid
       Enter LAN Number      ${inv_lan}
       Enter Mobile Number   ${inv_mobile_number}
       Enter Vehicle Number  ${inv_vehicle_number}
       click on Search Button
       No data available message should be displayed


