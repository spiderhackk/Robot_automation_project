
*** Settings ***
Library     SeleniumLibrary
Resource    ..//Resources/login_page_resource.robot
*** Variables ***
${dataPath}     /Users/shilajit/Documents/AllScreenShot
@{expected_item_list_name}     Samsung Note 8      Nokia Edge      iphone X

*** Test Cases ***

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

