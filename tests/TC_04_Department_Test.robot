*** Settings ***
Resource    ../pages/DepartmentPage.robot
Resource   ../resources/Keywords.robot

Test Setup    Run Keywords    Open Browser And Login    AND    Initialize Test Data

*** Test Cases ***
Test Add Department Functionality
    [Tags]        smoke   regression      add_department
    Navigate To Add Department Page
    Create New Department
    Search Department
    Edit Department
    Update Department
    Sleep    4s


