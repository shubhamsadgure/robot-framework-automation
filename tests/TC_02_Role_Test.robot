*** Settings ***
Resource    ../pages/RolePage.robot
Resource   ../resources/Keywords.robot


*** Test Cases ***
Test Add Role Functionality
    [Tags]      smoke    regression      add_role
    Navigate To Add Role Page
    ${role_name}=    Create New Role
    Search Role    ${role_name}
    Edit Role