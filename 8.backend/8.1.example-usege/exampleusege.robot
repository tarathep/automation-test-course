*** Settings ***
Library               Collections
Library               RequestsLibrary

*** Test Cases ***
Get Request
    Create Session    jsonplaceholder         https://jsonplaceholder.typicode.com
    ${resp}=          Get request    jsonplaceholder     /posts/1
    Dictionary Should Contain Value   ${resp.json()}     sunt aut facere repellat provident occaecati excepturi optio reprehenderit

Post Request
    Create Session    jsonplaceholder         https://jsonplaceholder.typicode.com
    &{data}=          Create dictionary       title=Robotframework requests  body=This is a test!  userId=1
    ${resp}=          Post request    jsonplaceholder     /posts    json=${data}
    Dictionary Should Contain Key   ${resp.json()}     id