*** Settings ***
Library           SeleniumLibrary
Resource          Commonusedkeyword.txt    # The New Keyword

*** Test Cases ***
TC_01_LoginScreen_Objects on page_EPIC01
    Loginandnavigatetourl
    change to iframe
    Objectonwebpage
    [Teardown]    Close Browser

TC02_Login screen - default text for username and password
    Loginandnavigatetourl
    change to iframe
    Defaultvalueusernamepassword
    [Teardown]    Close Browser

TC03_User doesn't enter email
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    EmptyUsername

TC04_User doesn't enter password
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    Emtypassword

TC05_User doesn't enter email or password
    Loginandnavigatetourl
    change to iframe
    EmptyUserNamePassword

TC06_User enters invalid email format
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    InvalidemailFormat

TC07_User logs in with invalid username and password
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    InvalidemailpasswordFormat

TC08_User logs in with valid username and password
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    ValidemailandpasswordFormat
    Select Frame    xpath://iframe[@id='iframe-undefined9']
    VerifyElementExist

TC_01_Book_a_Flight_Round Trip between
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    ValidemailandpasswordFormat
    Select Frame    xpath://iframe[@id='iframe-undefined9']
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://button[@name='Booking']
    VerifyElementExist
    Maximize Browser Window
    VerifyManageBookingElements
    ValidateFromCity
    Logout
    [Teardown]    Close Browser

TC02_Book a Flight - Round Trip between To and From Destinations_Verify 'To' cities
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    ValidemailandpasswordFormat
    Select Frame    xpath://iframe[@id='iframe-undefined9']
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://button[@name='Booking']
    VerifyElementExist
    Maximize Browser Window
    VerifyManageBookingElements
    ValidateToCity
    Logout

TC03_Book a Flight - Round Trip between To and From Destinations_Verify 'Class'
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    ValidemailandpasswordFormat
    Select Frame    xpath://iframe[@id='iframe-undefined9']
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://button[@name='Booking']
    VerifyElementExist
    Maximize Browser Window
    VerifyManageBookingElements
    ValidateClass
    Logout

TC04_Book a Flight - Verify Radio button should not be select by default
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    ValidemailandpasswordFormat
    Select Frame    xpath://iframe[@id='iframe-undefined9']
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://button[@name='Booking']
    VerifyElementExist
    Maximize Browser Window
    VerifyManageBookingElements
    VerifyRadiobuttonnotselected
    Logout

TC05_Book a Flight - One way Trip between To and From Destinations_From Toronto to Paris_Economy
    Set Selenium Speed    0.5
    Loginandnavigatetourl
    change to iframe
    ValidemailandpasswordFormat
    Select Frame    xpath://iframe[@id='iframe-undefined9']
    Wait Until Keyword Succeeds    2    1    Click Element    xpath://button[@name='Booking']
    VerifyElementExist
    Maximize Browser Window
    VerifyManageBookingElements
    BookFirstfareflight
