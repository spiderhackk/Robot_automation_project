*** Settings ***
Library     SeleniumLibrary
Resource    ..//Resources/login_page_resource.robot
Resource    ..//Resources/dashboard_page_resource.robot

*** Variables ***


*** Test Cases ***
#If chromedriver is outdated please run the updated_webdriver.py file. It will isntall latest chrome driver
Scenario: Validate job search
    [Tags]    job_search
    Given Open The Browser And Launch The App
    When Login With Valid Credentials
    Then Validating the search job from header

Scenario: validating user can able to apply for job
    [Tags]    job_apply
    Given Open The Browser And Launch The App
    When Login With Valid Credentials
    And Validating The Search Job From Header
    Then Validating that user able to apply for job