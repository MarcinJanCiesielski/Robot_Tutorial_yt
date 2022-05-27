*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
MyFirstTest
    Log    Hello World...

FirstSeleniuTest
    Open Browser    https://google.com   edge
    Set Browser Implicit Wait    5
    Click Button    //button[contains(.,'Zgadzam się')]
    Sleep    2
    Input Text    name=q    Robot Framework
    Press Keys    name=q    RETURN
    Sleep    5
    Close Browser
    Log    FirstSeleniumTest complited

SimpleLoginTest
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
    Input Text    name=txtUsername    ${CREDENCIALS}[0]
    Input Text    name=txtPassword    ${LOGIN_DATA}[pass]
    Click Button    id=btnLogin
    Click Element    id=welcome
    Click Element    //a[contains(.,'Logout')]
    Log    SimpleLoginTest completed
    Log    This test was executed by %{username} on %{os}    #Environment variables

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com    #Text
@{CREDENCIALS}    Admin    admin123                    #List
&{LOGIN_DATA}    user=Admin    pass=admin123           #Dictionary
