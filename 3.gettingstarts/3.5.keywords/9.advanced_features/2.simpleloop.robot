*** Test Cases ***
Example
    [Tags]    TC01
    FOR    ${animal}    IN    cat    dog
        Log To Console    ${animal}  #'cat' 'dog'
    END
    Log    Outside loop

Second Example
    [Tags]    TC02
    ${five}    ${last}    Set Variable    five    ten
    
    FOR    ${var}    IN    one    two    ${3}    four    ${five}
    ...    kuusi    7    eight    nine    ${last}
        Log    ${var}
    END

    