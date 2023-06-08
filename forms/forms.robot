*** Settings ***
Documentation   Sample test suite for handling tests in a form automatically
...             Contains one test case which handles the test form on DemoQA website
Resource        forms.resource
Test Teardown   Close Browser
Default Tags    forms

*** Test Cases ***
Valid Form Submit
    [Documentation]    FORM_001
    ...                Opens the DemoQA form, fills it with sample data and submits it
    Open Browser To Desired Page    /automation-practice-form
    Fill First Name    John
    Fill Last Name    Doe
    Fill Email    johndoe@test.com
    Select Gender    Male
    Fill Mobile Number    1234567890
    Fill Date Of Birth    1990-01-01
    Select Hobbies    Sports
    Select State    NCR
    Select City    Delhi
    Submit And Verify Form