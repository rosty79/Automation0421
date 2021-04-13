*** Settings ***
Library           SeleniumLibrary
Resource          CommonlyusedKeyword.txt

*** Variables ***
@{cities}
${City}           ${EMPTY}
${textfield}      ${EMPTY}

*** Test Cases ***
TC01_OpenBrowser
    Open Browser    http://www.google.com    Chrome
    Maximize Browser Window
    sleep    2
    Click Element    xpath://*[@id="zV9nZe"]/div
    sleep    2
    Close Browser

TC02_TextboxDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-09
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstName']    It passed
    sleep    2
    Input Text    xpath://input[@name='FirstName']    Pierre
    sleep    2
    Textfield Value Should Be    xpath://input[@name='FirstName']    Pierre
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name='LastName']
    Sleep    2
    Input Text    xpath://input[@name='LastName']    Rosty
    sleep    2
    Textfield Value Should Be    xpath://input[@name='LastName']    Rosty
    Sleep    2
    Clear Element Text    xpath://input[@name='FirstName']
    sleep    2
    Clear Element Text    xpath://input[@name='LastName']
    Sleep    2
    [Teardown]    close Browser

TC_03_ButtonExemple
    Open Browser    https://facebook.com    Chrome
    Maximize Browser Window
    Input Text    css:#email    nk55@hotmail.de
    Sleep    2
    Input Text    css:#pass    Leman1979
    Sleep    2
    Click Button    xpath://button[@value='1']
    [Teardown]    Close Browser

TC_04_Checkboxdemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-09
    sleep    2
    Page Should Contain Checkbox    xpath://input[@value='bmw']
    Sleep    2
    Select Checkbox    xpath://input[@value='bmw']
    Sleep    2
    Checkbox Should Be Selected    xpath://input[@value='bmw']
    sleep    2
    Unselect Checkbox    xpath://input[@value='bmw']
    [Teardown]    Close Browser

TC_05_ListElementDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-09
    Sleep    2
    Page Should Contain List    xpath://select[@id='FromCity']
    Sleep    2
    @{cities}    Get List Items    xpath://select[@id='FromCity']
    FOR    ${City}    IN    @{cities}
        LOG    ${City}
    END
    Sleep    3
    List Selection Should Be    xpath://select[@id='FromCity']    Toronto
    Sleep    2
    sleep    2

RadiobuttonDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-09
    Page Should Contain Radio Button    xpath://input[@value='flight']
    sleep    2
    Select Radio Button    flight    flighthotel
    sleep    2
    Radio Button Should Be Set To    flight    flighthotel
    sleep    3
    [Teardown]    Close Browser

TableExemple
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-09
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    The Table is found    INFO
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    Sleep    2
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    Sleep    2
    Table Column Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    sleep    1
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    ${textfield}    Get text    xpath://tbody/tr[4]/td[1]
    Log To Console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    Sleep    2
    [Teardown]    close Browser

FlightApplication
    Open Browser    https://ngendigital.com/demo-application    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-09
    Sleep    1
    Login to flight Application    Demo@gmail.com    Demopassword
    Sleep    5
    [Teardown]    Close Browser
