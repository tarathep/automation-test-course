*** Keywords ***
สร้าง Session ขอ Request ด้วย GET ไปที่
    [Arguments]    ${url}    ${Params}    ${Data}
    Create Session    API    ${API_URL}
    ${resp}    Get Request    API    ${Params}    ${Data}
    Request Should Be Successful    ${resp}
    [Return]    ${resp}

สร้าง Session ขอ Request ด้วย POST ไปที่
    [Arguments]    ${url}    ${Params}    ${Data}
    Create Session    API    ${API_URL}
    ${resp}    Post Request    API    ${Params}    ${Data}
    Request Should Be Successful    ${resp}
    [Return]    ${resp}

สร้าง Session ขอ Request ด้วย Delete ไปที่
    [Arguments]    ${url}    ${Params}    ${Data}
    Create Session    API    ${API_URL}
    ${resp}    Delete Request    API    ${Params}    ${Data}
    Request Should Be Successful    ${resp}
    [Return]    ${resp}

สร้าง Session ขอ Request ด้วย PUT ไปที่
    [Arguments]    ${url}    ${Params}    ${Data}
    Create Session    API    ${API_URL}
    ${resp}    Put Request    API    ${Params}    ${Data}
    Request Should Be Successful    ${resp}
    [Return]    ${resp}


เรียก member ด้วย id
    [Arguments]    ${id}
    ${resp}   สร้าง Session ขอ Request ด้วย GET ไปที่  ${API_URL}  ${PARAMS}/${id}  ${None}
    Request Should Be Successful    ${resp}
    [Return]    ${resp.content}

เพิ่ม member
    [Arguments]    ${Member}
    ${resp}    สร้าง Session ขอ Request ด้วย POST ไปที่    ${API_URL}    ${PARAMS}    ${Member}
    [Return]    ${resp.content}

แก้ไข member
    [Arguments]    ${Member}
    ${resp}    สร้าง Session ขอ Request ด้วย PUT ไปที่    ${API_URL}    ${PARAMS}    ${Member}
    [Return]    ${resp.content}

ลบ member ด้วย id
    [Arguments]    ${id}
    ${resp}   สร้าง Session ขอ Request ด้วย Delete ไปที่  ${API_URL}  ${PARAMS}/${id}  ${None}
    Request Should Be Successful    ${resp}
    [Return]    ${resp.content}