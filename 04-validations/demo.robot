*** Settings ***
Library    Browser

Documentation    Browser Library Documentation:
...              https://marketsquare.github.io/robotframework-browser/Browser.html


*** Variables ***
# General
${URL}    https://test-rpg.vercel.app/

# Locators
${CLICK_HERE_TO_PLAY_BUTTON}    //a[text()="Click here to play"]
${CHARACTER_NAME_INPUT}    //input[@name="name"]
${BUILD_SELECT}    //select
${START_GAME_BUTTON}    //button[text()="Start!"]


*** Test Cases ***
Verify Start Of The Game
    Start TestRPG
    Start Playing
    Prepare And Start Game    name=Ed    build=mage
    Close TestRPG


*** Keywords ***
Start TestRPG
    New Browser    browser=chromium    headless=${False}
    New Context
    New Page    url=${URL}

Start Playing
    Click    selector=${CLICK_HERE_TO_PLAY_BUTTON}

Prepare And Start Game
    [Arguments]    ${name}    ${build}
    Type Text    selector=${CHARACTER_NAME_INPUT}    txt=${name}
    Select Options By    ${BUILD_SELECT}    value    ${build}
    Click    selector=${START_GAME_BUTTON}

Close TestRPG
    Close Page
    Close Context
    Close Browser
