*** Settings ***
Library    example_function.py

*** Test Cases ***
#Assigning scalar variables
TC01 Returning from function
    [Tags]  TC01
    ${x} =    Get X    an argument
    Log    We got ${x}!         #We got an argument
    Log To Console    ${x}      #an argument

TC02 Create list assign to scalar variable
    [Tags]  TC02
    ${list} =    Create List    first    second    third
    Length Should Be    ${list}    3
    Log To Console    ${list}       #['first', 'second', 'third']
    Log Many    @{list}

#Assigning list variables
TC03 Create list assign to list variable
    [Tags]  TC03
    @{list} =    Create List    first    second    third
    Length Should Be    ${list}    3
    Log To Console    ${list}       #['first', 'second', 'third']
    Log Many    @{list}

#Assigning dictionary variables
TC04 Create list assign to list variable
    [Tags]    TC04
    &{dict} =    Create Dictionary    first=1    second=${2}    ${3}=third
    Length Should Be    ${dict}    3
    #Do Something    &{dict}
    Log    ${dict.first}         #1
    Log To Console    ${dict}    #{'first': '1', 'second': 2, 3: 'third'}

#Assigning multiple variables
TC05 Assign multiple
    [Tags]    TC05
    ${a}    ${b}    ${c} =    Get Three
    ${first}    @{rest} =    Get Three                  #one [two,three] = ['one','two', 'three']
    @{before}    ${last} =    Get Three                 #['one','two'] three = ['one','two', 'three']
    ${begin}    @{middle}    ${end} =    Get Three      #one ['two'] three = ['one','two', 'three']


