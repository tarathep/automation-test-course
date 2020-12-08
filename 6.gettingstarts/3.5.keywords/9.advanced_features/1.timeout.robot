*** Keywords ***
Hardcoded
    [Arguments]    ${arg}
    [Timeout]    1 minute 42 seconds
    Some Keyword    ${arg}

Configurable
    [Arguments]    ${arg}    ${timeout}
    [Timeout]    ${timeout}
    Some Keyword    ${arg}

Run Keyword with Timeout
    [Arguments]    ${keyword}    @{args}    &{kwargs}    ${timeout}=1 minute
    [Documentation]    Wrapper that runs another keyword with a configurable timeout.
    [Timeout]    ${timeout}
    Run Keyword    ${keyword}    @{args}    &{kwargs}