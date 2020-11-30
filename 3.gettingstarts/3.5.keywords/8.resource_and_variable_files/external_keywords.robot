*** Variables ***
${NAME}    Peter

*** Keywords ***
Input Name
    [Arguments]    ${name}
    Log To Console    ${name}

Input Password
    [Arguments]    ${password}
    Log To Console    ${password}