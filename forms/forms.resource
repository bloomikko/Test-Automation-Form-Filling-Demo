*** Settings ***
Documentation    Variables and keywords for form related automation tests
Library    SeleniumLibrary    run_on_failure=None
Library    XML

*** Variables ***
${BROWSER}    Firefox
${URL}    https://demoqa.com/automation-practice-form
${DELAY}    0.5
&{GENDER_ELEMENTS}    Male=gender-radio-1    Female=gender-radio-2    Other=gender-radio-3
&{HOBBY_ELEMENTS}    Sports=hobbies-checkbox-1    Reading=hobbies-checkbox-2    Music=hobbies-checkbox-3

*** Keywords ***
Fill Text Box
    [Documentation]    General text field filler
    [Arguments]    ${text_field_element_id}    ${text_to_be_inputted}
    Input Text    //input[@id="${text_field_element_id}"]    ${text_to_be_inputted}
    Textfield Value Should Be    //input[@id="${text_field_element_id}"]    ${text_to_be_inputted}

Dropdown Handler
    [Documentation]    General dropdown menu handler
    [Arguments]    ${dropdown_element_id}    ${item_to_be_selected}
    Press Keys    //div[@id="${dropdown_element_id}"]    ${item_to_be_selected}    ENTER
    Element Should Contain  //div[@id="${dropdown_element_id}"]    ${item_to_be_selected}

Open Browser To Form
    Open Browser    ${URL}    ${BROWSER}    service_log_path=${{os.path.devnull}}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be    DEMOQA

Fill First Name
    [Arguments]    ${first_name}
    Fill Text Box    firstName    ${first_name}

Fill Last Name
    [Arguments]    ${last_name}
    Fill Text Box    lastName    ${last_name}

Fill Email
    [Arguments]    ${email}
    Fill Text Box    userEmail    ${email}

Select Gender
    [Arguments]    ${gender}
    # Had to use Click Element instead of Select Radio Button due to obscuring (invisible?) element
    # (Error: is not clickable at point (XXX,XXX) because another element obscures it)
    Click Element    //label[@for="${GENDER_ELEMENTS}[${gender}]"]
    Radio Button Should Be Set To    gender    ${gender}

Fill Mobile Number
    [Arguments]    ${mobile_number}
    Fill Text Box    userNumber    ${mobile_number}

Fill Date Of Birth
    [Arguments]    ${date_of_birth}
    Press Keys    //input[@id="dateOfBirthInput"]    SHIFT+HOME    ${date_of_birth}
    Textfield Value Should Be    //input[@id="dateOfBirthInput"]    ${date_of_birth}
    Press Keys    //input[@id="dateOfBirthInput"]    ENTER

Select Hobbies
    [Arguments]    @{hobbies}
    # Had to use Click Element instead of Select Checkbox due to obscuring (invisible?) element
    # (Error: is not clickable at point (XXX,XXX) because another element obscures it)
    FOR    ${hobby}    IN    @{hobbies}
        Click Element    //label[@for="${HOBBY_ELEMENTS}[${hobby}]"]
        Checkbox Should Be Selected    //input[@id="${HOBBY_ELEMENTS}[${hobby}]"]
    END

Select State
    [Arguments]    ${state}
    Dropdown Handler    state    ${state}

Select City
    [Arguments]    ${city}
    Dropdown Handler    city    ${city}

Submit Form And Verify
    Click Element   //button[@id="submit"]
    Element Text Should Be    //div[@id="example-modal-sizes-title-lg"]    Thanks for submitting the form