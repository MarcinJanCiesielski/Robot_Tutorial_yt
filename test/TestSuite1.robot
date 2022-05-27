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
    Open Browser    https://opensource-demo.orangehrmlive.com    edge
    Set Browser Implicit Wait    5
    Input Text    name=txtUsername    Admin
    Input Text    name=txtPassword    admin123
    Click Button    id=btnLogin
    Click Element    id=welcome
    Click Element    //a[contains(.,'Logout')]
    Log    SimpleLoginTest completed
