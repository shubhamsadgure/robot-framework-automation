*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/Keywords.robot
Resource    ../pages/DepartmentPage.robot


Test Setup       Open Browser And Login
Test Teardown    Close Browser
