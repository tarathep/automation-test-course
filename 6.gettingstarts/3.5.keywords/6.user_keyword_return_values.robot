*** Test Cases ***
One Return Value
    ${ret} =    Return One Value    val1
    Log To Console    ${ret}    #val1

Multiple Values
    ${a}    ${b}    ${c} =    Return Three Values   #'foo' 'bar' 'zap'
    @{list} =    Return Three Values    #['foo' 'bar' 'zap']
    ${scalar}    @{rest} =    Return Three Values    #'foo' ['bar', 'zap']

*** Keywords ***
Return One Value
    [Arguments]    ${arg}
    [Return]    ${arg}

Return Three Values
    [Return]    foo    bar    zap