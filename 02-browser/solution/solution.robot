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
    New Browser    browser=chromium    headless=${False}
    New Context
    New Page    url=${URL}
    # Click "Click here to play"
    Click    selector=${CLICK_HERE_TO_PLAY_BUTTON}
    # Enter your character name
    Type Text    selector=${CHARACTER_NAME_INPUT}    txt=Tim
    # (Optional) Select your build
    Select Options By    ${BUILD_SELECT}    value    mage
    # Click "Start!"
    Click    selector=${START_GAME_BUTTON}
    Close Page
    Close Context
    Close Browser
