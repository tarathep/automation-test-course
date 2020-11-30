*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
TC01 Login ได้ด้วย username และ password ถูกต้อง
    [Tags]   TC01
    เปิด Browser ไปหน้า Login Page
    ใส่ Username    demo
    ใส่ Password    mode
    กดปุ่ม login
    หน้า Welcome Page ถูกเปิด
    [Teardown]    Close Browser

