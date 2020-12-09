*** Settings ***
Library    RequestsLibrary
Library    grade-lib.py

*** Variables ***
${API_URL}   http://localhost:8081
${PARAMS}    /students

*** Test Cases ***
TC01 Test Custom Library calGrade A Function
    ${result}    calGrade    ${88}
    Should Be Equal    ${result}    A
    Log To Console    ${result}

TC02 Test Custom Library calGrade B Function
    ${result}    calGrade    ${79}
    Should Be Equal    ${result}    B
    Log To Console    ${result}