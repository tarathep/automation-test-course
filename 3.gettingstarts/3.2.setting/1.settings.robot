*** Settings ***
Library    SeleniumLibrary
Resource    file.robot
Documentation    Test data can be read from variables and files.
Test Teardown    Close Browser
Suite Setup    Open Browser  www.google.com  Chrome
Test Setup    Click Element  id = gb_70
Test Teardown    Go To  www.google.com
Suite Teardown    Close Browser

