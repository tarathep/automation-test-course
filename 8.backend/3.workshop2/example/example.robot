*** Settings ***
Library    RequestsLibrary
Resource    keyword.robot
Resource    variable.robot


*** Test Cases ***
TC01 สวัสดี Backend System
    [Tags]    TC01
    ${resp}   สร้าง Session ขอ Request ด้วย GET ไปที่  ${API_URL}  ${None}  ${None}
    Should Be Equal As Strings    ${resp.content}    ${ผลลัพธ์ที่คาดหวัง Hello Backend System}