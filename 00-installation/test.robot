*** Settings ***
Library  Browser


*** Test Cases ***
Open a browser
    Open Browser    url=https://test-rpg.vercel.app
    Take Screenshot
