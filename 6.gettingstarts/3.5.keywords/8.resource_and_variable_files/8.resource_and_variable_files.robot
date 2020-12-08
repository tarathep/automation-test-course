*** Settings ***
Documentation     An example resource file
Resource    external_keywords.robot

*** Test Cases ***
TC01 call external_keyword from file
    Input Name    ${NAME}     #arg from perter  return Name1
    Input Password  passwordxxx    #return passwordxxx

