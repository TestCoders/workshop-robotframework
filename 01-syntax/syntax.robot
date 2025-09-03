*** Settings ***
Library    Collections
# Resource    my-keywords.resource

Documentation    Collections Library Documentation:
...              https://robotframework.org/robotframework/latest/libraries/Collections.html


*** Variables ***
${SCALAR}    Martijn
@{LIST}    Tim    Mark    Yuri
&{DICTIONARY}    name=Tim    email=tim@testcoders.nl    age=512


*** Test Cases ***
Log Some Data
    [Documentation]    This is test documentation
    # This is a comment
    Log    message=Data

Log With A Keyword
    Log Data With A Keyword


*** Keywords ***
Log Data With A Keyword
    [Documentation]    This is keyword documentation
    Log    Some Data
    Log    message=${SCALAR}
    Log List    list_=${LIST}
    Log Dictionary   dictionary=${DICTIONARY}    level=WARN
