
*** Settings ***
Library     SeleniumLibrary
Resource    ..//Resources/login_page_resource.robot
*** Variables ***

*** Test Cases ***
#If chromedriver is outdated please run the updated_webdriver.py file. It will isntall latest chrome driver
Scenario: Verify the Login page with valid credentials
   [Tags]    lunch_app  1
   Given Open The Browser And Launch The App
   When Login with valid credentials
   Then Home page should display


Scenario: Verify the login page with invalid credentials
    [Tags]    invalid_credentials   2
    Given Open The Browser And Launch The App
    When User Login With Invalid Credentials
    Then User should get the error message and user should not allow to navigate dashboard

