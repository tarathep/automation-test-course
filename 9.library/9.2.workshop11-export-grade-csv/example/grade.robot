*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
TC01 Test Custom Library calGrade Function
    ${result}    สร้าง Session ขอ Request ด้วย GET ไปที่    ${API_URL}    ${PARAMS}    ${None}

    Export CSV    log_student    ${result.json()}   #dict response json {}


    