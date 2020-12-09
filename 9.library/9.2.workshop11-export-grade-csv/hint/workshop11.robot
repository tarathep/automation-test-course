*** Settings ***
Library    RequestsLibrary
Library    grade-lib.py

*** Variables ***
${API_URL}   http://localhost:8081
${PARAMS}    /students

*** Keywords ***
สร้าง Session ขอ Request ด้วย GET ไปที่
    [Arguments]    ${url}    ${Params}    ${Data}
    Create Session    API    ${API_URL}
    ${resp}    Get Request    API    ${Params}    ${Data}
    Request Should Be Successful    ${resp}
    [Return]    ${resp}

*** Test Cases ***
TC01 Test Custom Library calGrade Function
    ${result}    สร้าง Session ขอ Request ด้วย GET ไปที่    ${API_URL}    ${PARAMS}    ${None}

    Export CSV    log_student    ${result.json()}


    