*** Settings ***
Library    Collections
Library    RequestsLibrary

Documentation    Documentation: https://github.com/MarketSquare/robotframework-requests


*** Variables ***
${URL}    https://test-rpg.vercel.app/api


*** Test Cases ***
Validate Builds
    ${response}    GET    url=${URL}/builds
    Dictionary Should Contain Key    dictionary=${response.json()}    key=thief
    Dictionary Should Contain Key    dictionary=${response.json()}    key=mage
    Dictionary Should Contain Key    dictionary=${response.json()}    key=knight
    Dictionary Should Contain Key    dictionary=${response.json()}    key=brigadier
