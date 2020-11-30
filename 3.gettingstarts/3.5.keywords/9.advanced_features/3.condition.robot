*** Test Cases ***
TC01 Condition1
    ${MSG}    Set Variable    Hellox
    Run Keyword If    '${MSG}' == 'Hello'   
    ...    Log To Console    TRUE
    ...    ELSE
    ...    Log To Console    FALSE

TC01 Condition2
    ${MSG}    Set Variable    Hello
    Run Keyword If    '${MSG}' == 'Hello'   
    ...    Log To Console    TRUE


