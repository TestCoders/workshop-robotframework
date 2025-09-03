*** Settings ***
Library    Browser

Documentation    Browser Library Documentation:
...              https://marketsquare.github.io/robotframework-browser/Browser.html


*** Variables ***
# Locators
${USERNAME_INPUT}    //*[@id="username"]
${PASSWORD_INPUT}    //*[@id="password"]
${LOGIN_BUTTON}    //*[@id="login"]


*** Test Cases ***
Verify Login Some Email
    [Documentation]    Only using low level keywords
    Type Text    selector=${USERNAME_INPUT}    txt=some-email@test.com
    Type Secret    selector=${PASSWORD_INPUT}    secret=CoolPassword123!
    Click    ${LOGIN_BUTTON}

Verify Login Other Email
    Type Text    selector=${USERNAME_INPUT}    txt=other-email@test.com
    Type Secret    selector=${PASSWORD_INPUT}    secret=OtherCoolPassword123!
    Click    ${LOGIN_BUTTON}

# etc...

Verify Login With A Keyword For Some Email
    [Documentation]    Using a high level keyword, also using positional arguments
    Login    some-email@test.com    CoolPassword123!

Verify Login With A Keyword For Other Email
    [Documentation]    Using a high level keyword, also using named arguments
    Login    username=other-email@test.com    password=OtherPassword123!


*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Type Text    selector=${USERNAME_INPUT}    txt=${username}
    Type Secret    selector=${PASSWORD_INPUT}    secret=${password}
    Click    ${LOGIN_BUTTON}
