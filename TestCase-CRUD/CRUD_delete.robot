#### Delete data ####

*** Settings ***
Library         SeleniumLibrary

Resource        ../Resources/login_admin_resource.robot
Resource        ../Resources/navigate_resource.robot

*** Test Cases ***
Scenario: Delete
    Given user in on CRUD page
    Then user Login
    And user Delete file
    Then user click OK

*** Keywords ***
user in on CRUD page
    navigate_resource.Navigate_to_Home_Page
user Login
    login_admin_resource.Insert_Valid_Username  username
    login_admin_resource.Insert_Valid_Password  password
    login_admin_resource.Click_Login_Button

user Delete file
    navigate_resource.Navigate_to_delete

user click OK
    Confirm Action