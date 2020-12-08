*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Valid Login
    Given Browser เปิดไปที่หน้า login page
    When user "demo" logs in ด้วย password "mode"
    Then หน้า Welcome Page ถูกเปิด

*** Keywords ***
Browser เปิดไปที่หน้า login page
    เปิด Browser ไปหน้า Login Page

User "${username}" logs in ด้วย password "${password}"
    ใส่ username    ${username}
    ใส่ password    ${password}
    Submit credentials
