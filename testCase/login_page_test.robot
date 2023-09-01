
*** Settings ***
Library     SeleniumLibrary
Resource    ..//Resources/login_page_resource.robot

*** Variables ***
${dataPath}     /Users/shilajit/Documents/AllScreenShot

*** Test Cases ***

Scenario: Verify the Login page with valid credentials
   [Tags]    lunch_app
   Given Open The Browser And Launch The App
   When Login with valid credentials
   Then Home page should display


Scenario: Verify the Home page item
    [Tags]    item
    Given Open The Browser And Launch The App
    When Login With Valid Credentials
    Then Verifying the list of item in the home page


Scenario: Verify the cart by adding item from home page
    [Tags]    cart
    Given Open The Browser And Launch The App
    When Login With Valid Credentials
    Then Verify the added items are avialble in th cart
