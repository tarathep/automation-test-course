*** Settings ***
Documentation     A test suite containing tests related to invalid login.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       เปิด Browser ไปหน้า Login Page
Suite Teardown    Close Browser
Test Setup        ไปที่หน้า Login
Test Template     Login ด้วย Credentials ที่ผิดแล้วจะ Fail
Resource          resource.robot

*** Test Cases ***
TC02  Login ด้วย Username ผิด
    [Tags]    TC02
    invalid          ${VALID PASSWORD}

TC03 Login ด้วย Password ผิด
    [Tags]    TC03
    ${VALID USER}    invalid

TC04 Login ด้วย Username และ Password ผิด  
    [Tags]    TC04
    invalid          whatever

TC05 Login ด้วย Username เป็นค่าว่าง
    [Tags]    TC05
    ${EMPTY}         ${VALID PASSWORD}

TC06 Login ด้วย Password เป็นค่าว่าง
    [Tags]    TC06
    ${VALID USER}    ${EMPTY}

TC07 Login ด้วย Username และ Password เป็นค่าว่าง
    [Tags]    TC07    
    ${EMPTY}         ${EMPTY}

*** Keywords ***
Login ด้วย Credentials ที่ผิดแล้วจะ Fail
    [Arguments]    ${username}    ${password}
    ใส่ Username    ${username}
    ใส่ Password    ${password}
    กดปุ่ม login
    Login จะต้องผิด username password ผิด

Login จะต้องผิด username password ผิด
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
