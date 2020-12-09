*** Settings ***
Library    RequestsLibrary
Resource    keyword.robot
Resource    variable.robot


*** Test Cases ***
TC01 Hello Backend System
    [Tags]    TC01
    ${resp}   สร้าง Session ขอ Request ด้วย GET ไปที่  ${API_URL}  ${None}  ${None}
    Should Be Equal As Strings    ${resp.content}    ${ผลลัพธ์ที่คาดหวัง Hello Backend System}

TC02 ลงชื่อเข้าใช้ระบบ Member Backend
    [Tags]    TC02
    ${resp}   สร้าง Session ขอ Request ด้วย POST ไปที่    ${API_URL}    /login    ${ข้อมูลทดสอบ ลงชื่อเข้าใช้ระบบ Member Backend}
    Should Be Equal As Strings    ${resp.content}    ${ผลลัพธ์ที่คาดหวัง ลงชื่อเข้าใช้ระบบ Member Backend}

TC03 เรียก members ทั้งหมด
    [Tags]    TC03
    ${resp}   สร้าง Session ขอ Request ด้วย GET ไปที่  ${API_URL}  ${PARAMS}  ${None}
    Request Should Be Successful    ${resp}
    Should Be Equal As Strings    ${resp.content}    ${ผลลัพธ์ที่คาดหวัง เรียก members ทั้งหมด}

TC04 เพิ่ม member
    [Tags]    TC04
    ${resp}    เพิ่ม member    ${ข้อมูลทดสอบ เพิ่ม member}
    Should Be Equal As Strings    ${resp}   ${ผลลัพธ์ที่คาดหวัง เพิ่ม member}

TC05 เรียก member ด้วย id
    [Tags]    TC05
    ${resp}    เรียก member ด้วย id  ${ข้อมูลทดสอบ เรียก member ด้วย id}
    Should Be Equal As Strings    ${resp}    ${ผลลัพธ์ที่คาดหวัง เรียก member ด้วย id}


TC06 แก้ไข member
    [Tags]    TC06
    ${resp}    แก้ไข member    ${ข้อมูลทดสอบ แก้ไข member}
    Should Be Equal As Strings    ${resp}   ${ผลลัพธ์ที่คาดหวัง แก้ไข member}


TC07 ลบ member ด้วย id
    [Tags]    TC07
    ${resp}   ลบ member ด้วย id    ${ข้อมูลทดสอบ ลบ member ด้วย id}
    Should Be Equal As Strings    ${resp}    ${ผลลัพธ์ที่คาดหวัง ลบ member ด้วย id}

#NAGATIVE CASE
TC08 เพิ่ม member ซ้ำ
    [Tags]    TC04
    เพิ่ม member    ${ข้อมูลทดสอบ เพิ่ม member}
    ${resp}    เพิ่ม member    ${ข้อมูลทดสอบ เพิ่ม member}
   
    Should Be Equal As Strings    ${resp}   ${ผลลัพธ์ที่คาดหวัง เพิ่ม member ซ้ำ}
    ลบ member ด้วย id  ${ข้อมูลทดสอบ ลบ member ด้วย id}