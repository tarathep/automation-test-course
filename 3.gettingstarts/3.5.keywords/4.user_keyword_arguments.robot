*** Keywords ***
One Argument
    [Arguments]    ${arg_name}
    Log To Console    Got argument ${arg_name}  #Got argument hello1

Three Arguments
    [Arguments]    ${arg1}    ${arg2}    ${arg3}
    Log    1st argument: ${arg1}        #hello1
    Log    2nd argument: ${arg2}        #hello2
    Log    3rd argument: ${arg3}        #hello3

*** Test Cases ***
TC01 keyword args
    One Argument  hello1
    Three Arguments  hello1  hello2  hello3