*** Settings ***
Library    Browser

Documentation    Browser Library Documentation:
...              https://marketsquare.github.io/robotframework-browser/Browser.html


*** Variables ***
# General
${URL}    https://test-rpg.vercel.app/

# Locators
${CLICK_HERE_TO_PLAY}    //a[text()="Click here to play"]
${CHARACTER_NAME_INPUT}    //input[@name="name"]
${DROPDOWN_SELECT_BOX}    //button[@role="combobox"]
${DROPDOWN_SELECT_WINDOW}    //div[@role="presentation"]
${DROPDOWN_SELECT_OPTION}    //div[@role="option"][text()="{value}"]
${START_GAME_BUTTON}    //button[text()="Start!"]


*** Test Cases ***
Verify Start Of The Game
    New Browser    browser=chromium    headless=${False}
    New Context
    New Page    url=${URL}
    # Click "Click here to play"

    # Enter your character name

    # (Optional) Select your build

    # Click "Start!"

    Close Page
    Close Context
    Close Browser
