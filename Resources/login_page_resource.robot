*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${item_name_xpath}  //app-card-list//h4
${add_button_xpath}     //button[text()="Add "]
@{expected_item_list_name}      iphone X    Samsung Note 8      Nokia Edge      Blackberry
${checkout_button_xpath}    //a[contains(text(),'Checkout')]
${item_in_cart_xpath}   //table//tbody//tr//button/span[contains(@class,'glyphicon-remove')]
*** Keywords ***
app is launch
    open browser    https://www.rahulshettyacademy.com/loginpagePractise/       safari

provide the valid crdentials
    input text      username    rahulshettyacademy
    input password  password    learning
    click button    signInBtn

page should navigate to home page
    wait until element is visible     //a[text()="ProtoCommerce Home"]



Open the browser and Launch the app
    [Documentation]    in this keyword luanching the app in the browser
    app is launch
    Maximize Browser Window
Login with valid credentials
    provide the valid crdentials

Home page should display
    page should navigate to home page


Verifying the list of item in the home page
    [Documentation]    in this checking the item present in the home page
    page should navigate to home page
    ${actual_item_count}=     Get Element Count       ${item_name_xpath}

    FOR    ${i}      IN RANGE  1   ${actual_item_count+1}
        ${item_name}=   Get Text    xpath:(//app-card-list//h4/a)[${i}]
        FOR    ${j}     IN  @{expected_item_list_name}
            IF    '${item_name}'=='${j}'
                Log    ${j} is present in the home page     console=yes
            ELSE
                Log     ${j} is not found in home page
            END
        END

    END

Verify the added items are avialble in th cart
    [Documentation]    checking cart with added item
    page should navigate to home page
    ${actual_item_count}=     Get Element Count       ${item_name_xpath}
    FOR    ${i}      IN RANGE  1   ${actual_item_count+1}
        ${item_name}=   Get Text    xpath:(//app-card-list//h4/a)[${i}]
        Click Button    xpath:(//button[text()="Add "])[${i}]
        Log    ${item_name} is added to cart    console=yes
    END
    Set Selenium Implicit Wait    10s
    Click Link      ${checkout_button_xpath}
    Sleep    10s


