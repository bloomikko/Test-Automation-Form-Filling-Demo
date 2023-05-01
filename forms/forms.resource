*** Settings ***
Documentation    Variables and keywords for form-related automation tests
Library    SeleniumLibrary    run_on_failure=None

*** Variables ***
${BROWSER}    Firefox
${URL}    https://demoqa.com/automation-practice-form
${DELAY}    0.5
&{GENDER_ELEMENTS}    Male=gender-radio-1    Female=gender-radio-2    Other=gender-radio-3
&{HOBBY_ELEMENTS}    Sports=hobbies-checkbox-1    Reading=hobbies-checkbox-2    Music=hobbies-checkbox-3

*** Keywords ***
# GENERAL KEYWORDS
Fill A Text Box
    [Documentation]    General text field filler
    [Arguments]    ${text_field_element_id}    ${text_to_be_inputted}
    Input Text    //input[@id="${text_field_element_id}"]    ${text_to_be_inputted}

Dropdown Handler
    [Documentation]    General dropdown menu handler
    [Arguments]    ${dropdown_element_id}    ${item_to_be_selected}
    Press Keys    //div[@id="${dropdown_element_id}"]    ${item_to_be_selected}    ENTER

# TEST RELATED KEYWORDS
Open Browser To Form
    Open Browser    ${URL}    ${BROWSER}    service_log_path=${{os.path.devnull}}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be    DEMOQA

Fill First Name
    [Arguments]    ${first_name}
    Fill A Text Box    firstName    ${first_name}

Fill Last Name
    [Arguments]    ${last_name}
    Fill A Text Box    lastName    ${last_name}

Fill Email
    [Arguments]    ${email}
    Fill A Text Box    userEmail    ${email}

Select Gender
    [Arguments]    ${gender}
    Click Element    //label[@for="${GENDER_ELEMENTS}[${gender}]"]

Fill Mobile Number
    [Arguments]    ${mobile_number}
    Fill A Text Box    userNumber    ${mobile_number}

Fill Date Of Birth
    [Arguments]    ${date_of_birth}
    Press Keys    //input[@id="dateOfBirthInput"]    SHIFT+HOME    ${date_of_birth}    ENTER

Select Hobbies
    [Arguments]    @{hobbies}
    FOR    ${hobby}    IN    @{hobbies}
        Click Element    //label[@for="${HOBBY_ELEMENTS}[${hobby}]"]
    END

Select State
    [Arguments]    ${state}
    Dropdown Handler    state    ${state}

Select City
    [Arguments]    ${city}
    Dropdown Handler    city    ${city}

Submit Form And Verify
    Click Element   //button[@id="submit"]
    Element Should Contain    //div[@id="example-modal-sizes-title-lg"]    Thanks for submitting the form