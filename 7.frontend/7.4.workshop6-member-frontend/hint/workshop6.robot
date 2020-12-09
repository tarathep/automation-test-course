*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:5000
${BROWSER}    Chrome
${DELAY}          0

*** Keywords ***
เปิด Browser ไปหน้า Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    หน้า login จะถูกเปิด

หน้า login จะถูกเปิด
    Element Should Contain    xpath=/html/body/form/h1    Please login in
    Wait Until Page Contains    Please login in

ใส่ username และ password แล้ว Login
    Input Text    id=inputEmail    j.marry@mail.com
    Input Text    id=inputPassword    password1
    Submit Form
    
login ได้ถูกต้อง
    Wait Until Page Contains    Welcome Admin(Marry)

หน้า Main Page จะถูกเปิด
    Wait Until Page Contains    Members Team
    Element Should Contain    xpath=/html/body/div[5]/h2    Members Team

กรอกข้อมูล member ใหม่
    Click Button    xpath=/html/body/div[1]/nav/button
    Wait Until Element Is Visible    id=modalAdd
    Input Text    id=modal_add_id   10003
    Input Text    id=modal_add_firstname    Big
    Input Text    id=modal_add_lastname    Box
    Click Element    xpath=//*[@id="modal_add_role"]/option[4]
    Input Text    id=modal_add_email    b.big@mail.com
    Input Text    id=modal_add_password    password
    Submit Form

กรอกข้อมูล แก้ไข member
    ${row_no}    จำนวนข้อมูลแถวในตาราง
    Click Button    xpath=/html/body/div[5]/table/tbody/tr[${row_no}]/td[6]/button[1]
    Wait Until Element Is Visible    id=modalEdit
    Textfield Value Should Be    id=modal_edit_id    10003

    Input Text    id=modal_edit_id    10003
    Input Text    id=modal_edit_firstname    Foo
    Input Text    id=modal_edit_lastname    Bar
    Click Element    xpath=//*[@id="modal_edit_role"]/option[3]
    Input Text    id=modal_edit_email    b.foo@mail.com
    Input Text    id=modal_edit_password    xxxxxxxx
    Click Element    xpath=//*[@id="modalEdit"]/div/div/form/div[2]/button[1]

ลบข้อมูล member
    ${row_no}    จำนวนข้อมูลแถวในตาราง
    Click Button    xpath=/html/body/div[5]/table/tbody/tr[${row_no}]/td[6]/button[2]
    Wait Until Element Is Visible    id=modalDelete
    Element Should Contain    id=modal_delete_message    10003
    Click Element    xpath=//*[@id="modalDelete"]/div/div/div[3]/button[1]


ข้อมูล member ใหม่ถูกเพิ่มแล้ว
    ${last_id}    ดึงข้อมูลตามแถวและคอลัม    -1    1
    Should Be Equal    ${last_id}    10003

ข้อมูล member ใหม่ถูกแก้ไขแล้ว
    ${last_id}              ดึงข้อมูลตามแถวและคอลัม    -1    1
    ${last_firstname}       ดึงข้อมูลตามแถวและคอลัม    -1    2
    ${last_lastname}        ดึงข้อมูลตามแถวและคอลัม    -1    3
    ${last_role}            ดึงข้อมูลตามแถวและคอลัม    -1    4
    ${last_email}           ดึงข้อมูลตามแถวและคอลัม    -1    5
    
    Should Be Equal    ${last_id}           10003
    Should Be Equal    ${last_firstname}    Foo
    Should Be Equal    ${last_lastname}     Bar
    Should Be Equal    ${last_role}         Developer
    Should Be Equal    ${last_email}        b.foo@mail.com


จำนวนข้อมูลแถวในตาราง
    ${table_size}    Get Element Count    xpath=/html/body/div[5]/table/tbody/tr
    [Return]    ${table_size}

ดึงข้อมูลตามแถวและคอลัม
    [Arguments]    ${row}    ${col}
    ${last_row_cell}     Get Table Cell    xpath=/html/body/div[5]/table    ${row}    ${col}
    [Return]    ${last_row_cell}

*** Test Cases ***
TC01 เปิดหน้า Login Page
    [Tags]    TC01
    เปิด Browser ไปหน้า Login Page
    Close Browser

TC02 Login ใส่ username และ password ถูกต้อง
    [Tags]    TC02
    เปิด Browser ไปหน้า Login Page
    ใส่ username และ password แล้ว Login
    login ได้ถูกต้อง
    หน้า Main Page จะถูกเปิด
    Close Browser

TC03 เพิ่ม member
    [Tags]    TC03
    เปิด Browser ไปหน้า Login Page
    ใส่ username และ password แล้ว Login
    login ได้ถูกต้อง
    หน้า Main Page จะถูกเปิด
    กรอกข้อมูล member ใหม่
    ข้อมูล member ใหม่ถูกเพิ่มแล้ว
    Close Browser

TC04 แก้ไข member
    [Tags]    TC04
    เปิด Browser ไปหน้า Login Page
    ใส่ username และ password แล้ว Login
    login ได้ถูกต้อง
    หน้า Main Page จะถูกเปิด
    กรอกข้อมูล แก้ไข member
    ข้อมูล member ใหม่ถูกแก้ไขแล้ว
    Close Browser

TC05 ลบ member
    [Tags]    TC05
    เปิด Browser ไปหน้า Login Page
    ใส่ username และ password แล้ว Login
    login ได้ถูกต้อง
    หน้า Main Page จะถูกเปิด
    ลบข้อมูล member
    Close Browser



