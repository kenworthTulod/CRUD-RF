#### DATA DRIVEN TEST ####

*** Settings ***

Library             SeleniumLibrary
Test Teardown       Close Browser
Test Template       Login with invalid credentials should fail

Resource            ../Resources/login_admin_resource.robot
Resource            ../Resources/navigate_resource.robot
Resource            ../Resources/error_resource.robot

*** Variables ***
${VALID_USERNAME}           admin
${VALID_PASSWORD}           admin
${ERROR_TEXTBOX}            Please fill out this field.

                #### RULE 1 ####
*** Test Cases ***                  USERNAME                PASSWORD                    EXPECTED
Invalid Username                    invalid                 ${VALID_PASSWORD}           ${EMPTY}
Invalid Password                    ${VALID_USERNAME}       invalid                     ${EMPTY}
Invalid Username and Password       invalid                 invalid                     ${EMPTY}
Empty Username                      ${EMPTY}                ${VALID_PASSWORD}           ${ERROR_TEXTBOX}
Empty Password                      ${VALID_USERNAME}       ${EMPTY}                    ${ERROR_TEXTBOX}
Empty Username and Password         ${EMPTY}                ${EMPTY}                    ${ERROR_TEXTBOX}

*** Keywords ***
Login with invalid credentials should fail
    [Arguments]             ${username}             ${password}         ${error}
    Open_browser_log
    Insert_username         ${username}
    Insert_password         ${password}
    Click_login_button
    Check_error             ${username}             ${password}         ${error}

Open_browser_log
    navigate_resource.Navigate_to_Home_Page

Insert_username
    [Arguments]             ${username}
    login_admin_resource.Insert_username    ${username}

Insert_password
    [Arguments]             ${password}
    login_admin_resource.Insert_Password  ${password}

Click_login_button
    login_admin_resource.Click_Login_Button

Check_error
    [Arguments]             ${username}             ${password}         ${error}
    error_resource.Check_Error      ${username}             ${password}         ${error}