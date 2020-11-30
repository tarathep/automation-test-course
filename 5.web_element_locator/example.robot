*** Settings ***
Library    SeleniumLibrary
 
*** Variables ***
${URL}    http://www.google.com
${BROWSER}    chrome
 
*** Test Cases ***
Fill data in search textbox google.com via locator
    Open Browser    ${URL}    chrome
    Input Text    id=lst-ib    element locator id
    Input Text    name=q     element locator name
    Input Text    css=#tsf > div:nth-child(2) > div.A8SBwf > div.RNNXgb > div > div.a4bIc > input     element locator css
    Input Text    xpath=//*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input     element locator xpath
    [Teardown]    Close Browser