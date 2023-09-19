*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ..//Resources/login_page_resource.robot
Library    ../common_library/keywords.py

*** Variables ***
${account_login_button_xpath}   //div[contains(@class,'css-1tef76f') and text()="Account"]
@{expected_header_tab}      Women   Men     Kids    Home    Tech    All Brands
*** Keywords ***

user on dashboard
    [Documentation]    verifying user on the dashboard page
    Wait Until Element Is Visible   ${account_login_button_xpath}   10s

Verifying the number of tab present in the home page header
    [Documentation]    verifying number of tab present in the dashboard
    Checking Tab In Dashboard
    FOR    ${i}     IN  @{expected_header_tab}
        IF    ${i}  IN      Checking Tab In Dashboard
            Log    ${i} tab is present in the header    console=yes
        ELSE
            Log    ${i} tab is not present
        END
    END



