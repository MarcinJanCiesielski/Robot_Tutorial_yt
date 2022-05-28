*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    I am inside Test Suite setup
Suite Teardown    Log    I am inside Test Suite teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown

Default Tags    sanity    

*** Test Cases ***
MyFirstTest
    [Tags]    smoke    #Override default tag
    Log    Hello World...

FirstSeleniumTest
    Set Tags    regression1    #Add tag to default tag
    Open Browser    https://google.com   edge
    Set Browser Implicit Wait    5
    Click Button    //button[contains(.,'Zgadzam się')]
    Sleep    2
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Sleep    5
    Close Browser
    Log    FirstSeleniumTest completed

SimpleLoginTest
    Set Tags    regression1, regression2
    Remove Tags    regression1
    Open Browser    ${URL}     edge
    Set Browser Implicit Wait    5
    Input Text    name=txtUsername    Admin
    Input Text    name=txtPassword    admin123
    Click Button    id=btnLogin
    Click Element    id=welcome
    Click Element    //a[contains(.,'Logout')]
    Log    SimpleLoginTest completed

SimpleLoginTest2
    Open Browser    ${URL}     edge
    Set Browser Implicit Wait    5
    Input Text    name=txtUsername    ${CREDENTIALS}[0]
    Input Text    name=txtPassword    ${LOGIN_DATA}[pass]
    Click Button    id=btnLogin
    Click Element    id=welcome
    Click Element    //a[contains(.,'Logout')]
    Log    SimpleLoginTest completed
    Log    This test was executed by %{username} on %{os}    #Environment variables

SimpleLoginTest3
    Open Browser    ${URL}     edge
    Set Browser Implicit Wait    5
    LoginKW
    Click Element    id=welcome
    Click Element    //a[contains(.,'Logout')]
    Log    SimpleLoginTest completed
    Log    This test was executed by %{username} on %{os}    #Environment variables

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com    #Text
@{CREDENTIALS}    Admin    admin123                    #List
&{LOGIN_DATA}    user=Admin    pass=admin123           #Dictionary

*** Keywords ***
LoginKW
    Input Text    name=txtUsername    ${CREDENTIALS}[0]
    Input Text    name=txtPassword    ${LOGIN_DATA}[pass]
    Click Button    id=btnLogin

