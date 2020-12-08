*** Keywords ***
สร้าง Session ขอ Request ด้วย GET ไปที่
    [Arguments]    ${url}    ${Params}    ${Data}
    Create Session    API    ${API_URL}
    ${resp}    Get Request    API    ${Params}    ${Data}
    Request Should Be Successful    ${resp}
    [Return]    ${resp}