*** Settings ***
Documentation    General.resource works as a file where very generic, easily reusable functions are maintained. For example, should the project expand in the future,
...              very basic element detection or text fill functions are easily found here, This way, the code base stays smaller when there is no need to rewrite
...              exact same functions over and over again.
Library    SeleniumLibrary    run_on_failure=None

*** Variables ***
${BROWSER}     Firefox
${BASE_URL}    https://demoqa.com
${DELAY}       0.5

*** Keywords ***
Open Browser To Desired Page
    [Documentation]    General browser opener keyword
    [Arguments]    ${page_endpoint}
    ${url_to_be_opened}    Catenate    SEPARATOR=    ${BASE_URL}    ${page_endpoint}
    Open Browser    ${url_to_be_opened}    ${BROWSER}    service_log_path=${{os.path.devnull}}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be    DEMOQA

Fill Element With Text
    [Documentation]    General text field filler, works for HTML inputs or text areas (must be passed as an argument)
    [Arguments]    ${html_element_type}    ${text_field_element_id}    ${text_to_be_inputted}
    ${element}    Set Variable    //${html_element_type}\[@id="${text_field_element_id}"]
    Input Text    ${element}    ${text_to_be_inputted}
    IF    "${html_element_type}" == "input"
        Textfield Value Should Be    ${element}    ${text_to_be_inputted}
    ELSE IF    "${html_element_type}" == "textarea"
        Textarea Value Should Be    ${element}    ${text_to_be_inputted}
    END