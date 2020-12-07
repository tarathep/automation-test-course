*** Settings ***
Library    RequestsLibrary

*** Variables ***
${API_URL}    http://localhost:8080
${PARAMS}    /memebers


*** Test Cases ***
EX00 Template Steps
    #STEP1 Open Connection
    Create Session    API    ${API_URL}

    #STEP2 Call API and Set Paramister
    ${resp} =    Get Request    API    ${PARAMS}

    #STEP3 PROCESS ..

    #STEP4 Request Should Be Successful

EX01 Example Responses Attbutes
    Create Session    API    ${API_URL}
    ${resp} =    Get Request    API    ${None}
    
    Log To Console    ${resp.status_code}  # |> 200 , 500
    Log To Console    ${resp.headers}  # header |> {'Date': 'Thu, 03 Dec 2020 17:33:33 GMT', 'Server': 'WSGIServer/0.2 CPython/3.9.0', 'Content-Length': '19', 'Content-Type': 'text/html; charset=UTF-8'}
    Log To Console    ${resp.content}  # body raw data |> Hello Member System

EX02 Example Responses JSON
    Create Session    API    ${API_URL}
    ${resp} =    Get Request    API    ${None}
    
    #TYPE DICT
    ${json} =    To Json    ${resp.content}

    Log To Console    ${json['members']}
    Log To Console    ${json['members'][0]}
    Request Should Be Successful    ${resp}

EX03 Example Request sender params
    Create Session    API    ${API_URL}
    ${resp} =    Get Request    API    

TC01 Get Hello Backend System
    #STEP 1
    Create Session    API    ${API_URL}

    #STEP 2 CALL METHED PARAMS
    ${resp} =    Get Request    API    ${None}
    Responses Attbutes  ${resp}
    
    # ${json} =    To Json    ${resp.content}
    # Log To Console    ${json['members'][0]}
    # Request Should Be Successful    ${resp}
    


    