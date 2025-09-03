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
${CHARACTER_NAME_LABEL}    //h3[@data-testid="character-name"]
${CHARACTER_STATS_LABEL}    //p[@data-testid="character-stats"]
${ADVENTURE_CONTAINER}    //*[@data-testid="adventure-container"]


*** Test Cases ***
Verify Start Of The Game Valid Name
    Start TestRPG
    Start Playing
    Prepare And Start Game    name=Pietje    build=mage
    Validate The Game Started    expected_name=Pietje    expected_stats=A level 1 mage
    Close TestRPG

Verify Start Of The Game Invalid Name
    Start TestRPG
    Start Playing
    Prepare And Start Game    name=p    build=mage
    Validate The Game Started    expected_name=p    expected_stats=A level 1 mage
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

Validate The Game Started
    [Arguments]    ${expected_name}    ${expected_stats}
    Wait For Elements State    selector=${ADVENTURE_CONTAINER}
    ${actual_name}    Get Text   selector=${CHARACTER_NAME_LABEL}
    Should Be Equal As Strings    first=${expected_name}    second=${actual_name}
    ${actual_stats}    Get Text   selector=${CHARACTER_STATS_LABEL}
    Should Be Equal As Strings    first=${expected_stats}    second=${actual_stats}

Close TestRPG
    Close Page
    Close Context
    Close Browser
