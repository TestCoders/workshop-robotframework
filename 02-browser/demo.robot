*** Settings ***
Library    Browser    enable_presenter_mode=${True}

Documentation    Browser Library Documentation:
...              https://marketsquare.github.io/robotframework-browser/Browser.html


*** Variables ***
# General
${URL}    https://test-rpg.vercel.app/

# Locators
${HOMEPAGE_BANNER}    //*[@data-testid="hero"]


*** Test Cases ***
Verify TestRPG Homepage
    New Browser    browser=chromium    headless=${False}
    New Context
    New Page    url=${URL}
    Wait For Elements State    selector=${HOMEPAGE_BANNER}
    Take Screenshot
    Close Page
    Close Context
    Close Browser
