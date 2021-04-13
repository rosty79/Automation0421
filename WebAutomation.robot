*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
OpenBrowser
    Open Browser    https://facebook.com    Chrome
    Maximize Browser Window
    Sleep    2
    Input Text    css: #email    nk55@hotmail.de
    Sleep    2
    Input Text    css:#pass    Npr300779
    Close Browser

TextboxDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name= 'FirstName']    It has failed    Debug
    Sleep    2
    Textfield Value Should Be    xpath://input[@name= ' FirstName ' ]    NgenDigital
    Sleep    2
    Clear Element Text    xpath://input[@name= ' FirstName ' ]
    Sleep    2
    Select Frame    id=iframe-014
    [Teardown]    Close Browser
