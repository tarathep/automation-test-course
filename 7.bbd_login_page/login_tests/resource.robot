*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
เปิด Browser ไปหน้า Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    หน้า login จะถูกเปิด

หน้า login จะถูกเปิด
    Title Should Be    Login Page

ไปที่หน้า Login
    Go To    ${LOGIN URL}
    หน้า login จะถูกเปิด

ใส่ Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

ใส่ Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

กดปุ่ม login
    Click Button    login_button

หน้า Welcome Page ถูกเปิด
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
