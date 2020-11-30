*** Variables ***
#Scalar variable syntax
${NAME}         Robot Framework
${VERSION}      2.0
${ROBOT}        ${NAME} ${VERSION}
${EXAMPLE}      This value is joined    together with a space
${MULTILINE}    SEPARATOR=\n    First line    
...             Second line     Third line

#List variable syntax
@{NAMES}        Matti       Teppo
@{NAMES2}       @{NAMES}    Seppo
@{NOTHING}
@{MANY}         one         two      three      four
...             five        six      seven

#Dict variable syntax
&{USER 1}       name=Matti    address=xxx         phone=123
&{USER 2}       name=Teppo    address=yyy         phone=456
&{MANY}         first=1       second=${2}         ${3}=third
&{EVEN MORE}    &{MANY}       first=override      empty=
...             =empty        key\=here=value


*** Test Cases ***
TC01 Scalar variable syntax
    Log To Console    ${NAME}
    Log To Console    ${VERSION}
    Log To Console    ${ROBOT}
    Log To Console    ${EXAMPLE}
    Log To Console    ${MULTILINE}

TC02 List variable syntax
    Log To Console    ${NAMES}
    Log To Console    ${NAMES2}
    Log To Console    ${NOTHING}
    Log To Console    ${MANY}

TC03 Dict variable syntax
    Log To Console    ${USER 1.name}



