#### Create new Entry ####

*** Settings ***
Library         SeleniumLibrary
# Test Teardown       Close Browser

Resource        ../Resources/navigate_resource.robot
Resource        ../Resources/error_resource.robot
Resource        ../Resources/info_resource.robot
Resource        ../Resources/login_admin_resource.robot
Resource        ../Resources/info_bad_resource.robot


*** Test Cases ***
# Scenario: Good path             #### RULE 1 - GOOD ####
#     Given user in on CRUD page
#     Then user Login
#     And user navigate to Create
#     Then user insert Lastname
#     Then user insert Firstname
#     Then user select Gender
#     Then user insert UserID
#     Then user choose College
#     Then user insert Contact Number
#     Then user insert date
#     Then user insert Message
#     And user click Save
    
# Scenario: Bad path (lastname special char)      #### RULE 2 ####
#     Given user in on CRUD page
#     Then user Login
#     And user navigate to Create
#     Then user insert bad special char lastname

# Scenario: Bad path (firstname special char)     #### RULE 3 ####
#     Given user in on CRUD page
#     Then user Login
#     And user navigate to Create
#     Then user insert bad special char firstname

Scenario: Bad path (id more digit)              #### RULE 4 ####
    Given user in on CRUD page
    Then user Login
    And user navigate to Create
    Then user insert bad more id num

# Scenario: Bad path (id special char)             #### RULE 5 ####
#     Given user in on CRUD page
#     Then user Login
#     And user navigate to Create
#     Then user insert bad special char id num

# Scenario: Bad path (contact more digit)              #### RULE 6 ####
#     Given user in on CRUD page
#     Then user Login
#     And user navigate to Create
#     Then user insert bad more contact num

# Scenario: Bad path (contact special char)             #### RULE 7 ####
#     Given user in on CRUD page
#     Then user Login
#     And user navigate to Create
#     Then user insert bad special char contact num

# Scenario: Bad path (empty textboxes)             #### RULE 8 ####
#     Given user in on CRUD page
#     Then user Login
#     And user navigate to Create
#     And user click Save
#     Then error message prompt lastname

*** Keywords ***
#### Navigation Resource ####
user in on CRUD page
    navigate_resource.Navigate_to_Home_Page
user Login
    login_admin_resource.Insert_Valid_Username  username
    login_admin_resource.Insert_Valid_Password  password
    login_admin_resource.Click_Login_Button
user navigate to Create
    navigate_resource.Navigate_to_create


#### Information resource ####
user insert Lastname
    info_resource.Check_lastname
user insert Firstname
    info_resource.Check_firstname
user select Gender
    info_resource.Gender_1
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
user click Save
    info_resource.Click_save

#### Bad info ####
user insert bad special char lastname
    info_bad_resource.Bad_lastname_SPC
user insert bad special char firstname
    info_bad_resource.Bad_firstname_SPC
user insert bad more id num
    info_bad_resource.Bad_userid_number
user insert bad special char id num
    info_bad_resource.Bad_userid_SPC
user insert bad more contact num
    info_bad_resource.Bad_contact_number
user insert bad special char contact num
    info_bad_resource.Bad_contact_SPC

#### ERROR ####
error message prompt lastname
    error_resource.Error_Empty_lastname