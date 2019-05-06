#####       ADMIN PAGE      #####

*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary                locale=en_AU

*** Variables ***
${VALID_USERNAME}                       admin
${VALID_PASSWORD}                       admin


*** Keywords ***

##### LOGIN CORRECT CREDENTIALS #####
Insert_Username
    [Arguments]         ${username}
    Input Text          name=username          ${username}

Insert_Password
    [Arguments]         ${password}
    Input Text          name=password       ${password}


### use only for accessing pages
Insert_Valid_Username
    [Arguments]             ${username}
    Input Text              name=username          ${VALID_USERNAME}

Insert_Valid_Password
    [Arguments]             ${password}
    Input Text              name=password       ${VALID_PASSWORD}


Click_Login_Button
    Click Element           xpath=/html/body/div/form/div[3]/button
    ${Title}                Get Title
    Log                     ${Title}
    Title Should Be         ${Title}





