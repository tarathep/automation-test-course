*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
เปิด browser ด้วย chrome
    Open Browser
...    https://www.kimschiller.com/page-object-pattern-tutorial/
...    chrome 

กรอกข้อมูลลง textfield ตาม id
    [Arguments]    ${ID}    ${TEXT}
    Input Text    id=${ID}    ${TEXT}

กดปุ่ม signup
    Click Button    id=signup

*** Test Cases ***
TC01 ทดสอบ signup page
    เปิด browser ด้วย chrome
    กรอกข้อมูลลง textfield ตาม id    firstname    john
    กรอกข้อมูลลง textfield ตาม id    lastname    peper
    กรอกข้อมูลลง textfield ตาม id    address    99/123 m4
    กรอกข้อมูลลง textfield ตาม id    zipcode    101100
    กดปุ่ม signup
    Wait Until Page Contains    Thank you!
    [Teardown]   Close Browser
