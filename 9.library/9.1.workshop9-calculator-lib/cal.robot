*** Settings ***
Library    cal-lib.py

*** Test Cases ***
TC01 Test Custom Library Sum Function
    ${result}    sum    ${5}    ${5}        #5+5=result
    Should Be Equal    ${result}    ${10}   #result = 10?
    Log To Console    ${result}