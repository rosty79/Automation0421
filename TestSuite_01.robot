*** Settings ***
Force Tags        LOGIN
Library           SeleniumLibrary
Library           ExcelLibrary

*** Variables ***
${var1}           4    # This is my first scalar
${var2}           4    # This is the second
@{USER}           Bharat    Robotframework
&{Credentials}    username=bharat    password=bharat

*** Test Cases ***
TC01
    [Documentation]    This is my first test case . It used to compare two variables. *Testcases01* _This will be initalic_
    ...    Link is http://www.google.com
    Should Be Equal    ${var1}    ${var2}

TC02
    [Setup]    SetupDemo
    Should Not Be Equal As Strings    @{USER} [0]    @{USER} [1]
    [Teardown]    TeardownDemo

TC03
    Should Be Equal As Strings    &{Credentials} [username]    &{Credentials} [password]

TC04

TC05
    [Template]    Should Be Equal As Integers
    4    4
    6    6
    8    8
    12    12
    15    3

TC06
    Comparetwovariables
    open Browser

*** Keywords ***
SetupDemo
    Log To Console    This is set up

Teardowndemo
    Log To Console    This is teardown
