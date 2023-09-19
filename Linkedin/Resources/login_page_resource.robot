*** Settings ***
Library  SeleniumLibrary
Library    Collections
Variables   /Users/shilajit/PycharmProjects/pythonRobotProject/Linkedin/Library/variables.py
*** Variables ***
${username_text_field_xpath}    //input[@id="session_key"]
${password_input_xpath}     //input[@id="session_password"]
${submit_button}    //button[@data-id="sign-in-form__submit-btn"]
*** Keywords ***
Launch the app
    Create Webdriver    Chrome      executable_path=/Users/shilajit/PycharmProjects/pythonRobotProject/common_library/bin/chromedriver
    Go To       https://www.linkedin.com/home

provide the valid crdentials
    ${decode_username}=     Evaluate    base64.b64decode('${username}').decode('utf-8')   modules=base64
    input text      ${username_text_field_xpath}    ${decode_username}
    ${decode_password} =    Evaluate    base64.b64decode('${password}').decode('utf-8')   modules=base64
    input password  ${password_input_xpath}     ${decode_password}
    Set Selenium Implicit Wait    3s
    click button    ${submit_button}
    Sleep    10s


page should navigate to home page
    ${status}=  Run Keyword And Return Status    wait until element is visible     //div[@class="scaffold-layout__sidebar"]  20s
    IF    '${status}'=='True'
        Log    dashboard is displayed
    ELSE
        Log    Fail    dashboard is not displayed
    END


Open the browser and Launch the app
    [Documentation]    in this keyword luanching the app in the browser
    Launch the app
    Sleep    5s
    Maximize Browser Window
Login with valid credentials
    provide the valid crdentials

Home page should display
    page should navigate to home page


User Login With Invalid Credentials
    [Documentation]    in this keyword passing the invalid credentials and try to login
    ${decode_username}=     Evaluate    base64.b64decode('${invalidusername}').decode('utf-8')   modules=base64
    input text      ${username_text_field_xpath}    ${decode_username}
    ${decode_password} =    Evaluate    base64.b64decode('${invalidpassword}').decode('utf-8')   modules=base64
    input password  ${password_input_xpath}     ${decode_password}
    Set Selenium Implicit Wait    3s
    click button    ${submit_button}
    Sleep    10s

User should get the error message and user should not allow to navigate dashboard
    [Documentation]    in this keyword verifying the login error message
    Wait Until Element Is Visible