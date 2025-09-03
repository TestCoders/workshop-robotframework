*** Settings ***
Library    keywords.py


*** Variables ***
@{BUILDS}    Thief    Mage    Knight    Brigadier


*** Test Cases ***
Get Random Build
    ${build}    Get Random Build From List    list=${BUILDS}
    Should Contain    container=${BUILDS}    item=${build}
