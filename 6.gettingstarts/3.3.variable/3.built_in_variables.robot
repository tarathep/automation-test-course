*** Test Cases ***
# Operating-system variables
Example
    Create Binary File    ${CURDIR}${/}input.data    Some text here${\n}on two lines
    Set Environment Variable    CLASSPATH    ${TEMPDIR}${:}${CURDIR}${/}foo.jar

# Number variables
TC01 Number Variable
    Connect    example.com    80       # Connect gets two strings as arguments
    Connect    example.com    ${80}    # Connect gets a string and an integer
    Do X    ${3.14}    ${-1e-4}        # Do X gets floating point numbers 3.14 and -0.0001
    
    Should Be Equal    ${0b1011}    ${11}
    Should Be Equal    ${0o10}      ${8}
    Should Be Equal    ${0xff}      ${255}
    Should Be Equal    ${0B1010}    ${0XA}
    Should Be Equal    ${1+1}    ${2}
    Should Be Equal    ${11}    11  # Not Equal Deffrent Data Type Int != String

# Boolean and Null/None
*** Test Cases ***
Boolean
    Set Status    ${true}               # Set Status gets Boolean true as an argument
    Create Y    something   ${false}    # Create Y gets a string and Boolean false

None
    Do XYZ    ${None}                   # Do XYZ gets Python None as an argument

Null
    ${ret} =    Get Value    arg        # Checking that Get Value returns Java null
    Should Be Equal    ${ret}    ${null}


# Space and empty variables
*** Test Cases ***
One space
    Should Be Equal    ${SPACE}          \ \

Four spaces
    Should Be Equal    ${SPACE * 4}      \ \ \ \ \

Ten spaces
    Should Be Equal    ${SPACE * 10}     \ \ \ \ \ \ \ \ \ \ \

Quoted space
    Should Be Equal    "${SPACE}"        " "

Quoted spaces
    Should Be Equal    "${SPACE * 2}"    " \ "

Empty
    Should Be Equal    ${EMPTY}          \

