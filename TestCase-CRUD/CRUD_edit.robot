#### Edit Entry ####

*** Settings ***
Library         SeleniumLibrary
# Test Teardown       Close Browser

Resource        ../Resources/navigate_resource.robot
Resource        ../Resources/error_resource.robot
Resource        ../Resources/info_resource.robot
Resource        ../Resources/login_admin_resource.robot
Resource        ../Resources/info_bad_resource.robot

*** Test Cases ***
Scenario: Edit             
    Given user in on CRUD page
    Then user Login
    And user navigate to Edit
    Then user insert Lastname
    Then user insert Firstname
    Then user select Gender
    Then user insert UserID
    Then user choose College
    Then user insert Contact Number
    Then user insert date
    Then user insert Message
    And user click Update


*** Keywords ***
#### Navigation Resource ####
user in on CRUD page
    navigate_resource.Navigate_to_Home_Page
user Login
    login_admin_resource.Insert_Valid_Username  username
    login_admin_resource.Insert_Valid_Password  password
    login_admin_resource.Click_Login_Button
user navigate to Edit
    navigate_resource.Navigate_to_Edit

#### Information resource ####
user insert Lastname
    info_resource.Check_lastname
user insert Firstname
    info_resource.Check_firstname
user select Gender
    info_resource.Gender_2
user insert UserID
    info_resource.Check_userID
user choose College
    info_resource.College_1
user insert Contact Number
    info_resource.Check_contact
user insert Message
    info_resource.Check_message
user insert date
    info_resource.Birthdate_1
user click Update
    info_resource.Click_update