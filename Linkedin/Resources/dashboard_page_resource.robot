*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ..//Resources/login_page_resource.robot
Library    ../../common_library/keywords.py
Library    OperatingSystem
Library    String

*** Variables ***
${job_tab}      //nav[@class="global-nav__nav"]//span[text()="Jobs"]
${input_job_field_xpath}    //input[@role="combobox"]
${result_text}  //h1[@id="results-list__title"]
${number_of_result_xpath}   //div[@class="jobs-search-results-list__subtitle"]/span
${number_of_item_xpath}     //ul[@class="scaffold-layout__list-container"]/li[{0}]
${button_type_xpath}    //div[@class="mt5"]//span[@class="artdeco-button__text"][1]
${apply_button_xpath}   (//span[text()="Apply"])[1]
${easy_apply_xpath}     (//span[text()="Easy Apply"])[1]
*** Keywords ***

Validating the search job from header
    [Documentation]    here clicking on the job tab in the header
    ...     getting job title text from the txt file
    Click Element    ${job_tab}
    Sleep    5s
    ${get_text}     Get File    ${current_directory}${text_file_path}
    Input Text      ${input_job_field_xpath}    ${get_text}
    Sleep    2s
    Press Keys  None    RETURN
    Wait Until Element Is Visible    ${result_text}     10s
    ${get_number_of_result}     Get Text    ${number_of_result_xpath}
    @{extract_text_from_number}     Split String    ${get_number_of_result}     ${SPACE}
    ${text}=    Set Variable    ${extract_text_from_number}[0]
    ${total_number_result}=  Convert String To Int    ${text}
    IF    ${total_number_result}>0
        Log    ${total_number_result}   console=yes
    ELSE
        Log    ${total_number_result}   console=yes
    END



Validating that user able to apply for job
    [Documentation]    click on each job found in the results
    ${len}      Get Length    ${number_of_item_xpath}
    FOR    ${i}     IN RANGE    1  5
        Set Selenium Implicit Wait    2s
        ${complete_button}      Evaluate        '${number_of_item_xpath}'.format(${i})
        Click Element   ${complete_button}
        Sleep    3s
        ${type_of_text}=    Get Text   ${button_type_xpath}
        Sleep    5s
        IF    '${type_of_text}'=='Apply'
            Sleep    2s
            Click Element    ${apply_button_xpath}
            ${chile_window}     Switch Window    NEW
            Sleep    5s
            ${get_the_new_window_title_status}=    Run Keyword And Return Status    Get Title
            IF    '${get_the_new_window_title_status}'=='True'
                Log    ${get_the_new_window_title_status}   console=yes
                Switch Window    MAIN
            END
        ELSE
            Sleep    3s
            Click Element    ${easy_apply_xpath}
            Sleep    2s
            Click Element    //div[@role="dialog"]/button
            Sleep    2s
            Click Element    //span[text()="Discard"]
        END
    END


