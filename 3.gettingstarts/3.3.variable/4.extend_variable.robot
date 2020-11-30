*** Settings ***
Library    example_function.py

*** Test Case ***
TC01 Extend variable syntax
    [Tags]    TC01

    @{LIST_DATA}    Create List    A    B    C
    &{DICT_DATA}    Create Dictionary    KEY1=A    KEY2=B    KEY3=C

    Log To Console    \nValue List is ${LIST_DATA}  #['A','B','C']
    Log To Console    \nValue Dict is ${DICT_DATA}  #{'KEY1': 'A', 'KEY2': 'B', 'KEY3': 'C'}

    Log To Console    \nValue List by Index is ${LIST_DATA[0]}  #'A'
    Log To Console    \nValue Dict by Key is ${DICT_DATA.KEY2}  #'B'

    ${string} =    Set Variable    abc
    Log To Console    ${string.upper()}  # 'ABC'
    Log To Console    ${string * 2}  # 'abcabc'

    ${number} =    Set Variable    ${-2}
    Log To Console    ${number * 10}   #-20
    Log To Console    ${number.__abs__()}  #2

TC02 Extended variable assignment
    [Tags]   TC02

    @{LIST_DATA}    Create List    A    B    C
    &{DICT_DATA}    Create Dictionary    KEY1=A    KEY2=B    KEY3=C

    Log To Console    ${LIST_DATA}      #['A','B','C']
    Log To Console    ${DICT_DATA}      #{'KEY1': 'A', 'KEY2': 'B', 'KEY3': 'C'}

    #ASSIGN NEW VALUE
    ${LIST_DATA[0]} =    Set Variable    D
    Log To Console    ${LIST_DATA}      #['A', 'B', 'C']
    Log To Console    ${LIST_DATA[0]}   #'D'

    #ASSIGN REPLACE VALUE
    ${DICT_DATA.KEY1} =    Set Variable    D
    Log To Console    ${DICT_DATA}      #{'KEY1': 'D', 'KEY2': 'B', 'KEY3': 'C'}
    Log To Console    ${DICT_DATA.KEY1}     #'D'
    
TC03 Evaluation namespace
    [Tags]    TC03
    ${VAR}    Set Variable    123

    #Use builtins
    Should Be Equal      ${{len('${VAR}')}}        ${3}    #int
    Should Be Equal      ${{int('${VAR}')}}        ${123}  #int

    #Access modules
    Should Be Equal      ${{os.sep}}               ${/}
    Should Be Equal      ${{round(math.pi, 2)}}    ${3.14}
    Should Start With    ${{robot.__version__}}    3.
    
    

