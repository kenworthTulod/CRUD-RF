#### Error Resources ####

*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary            locale=en_AU

*** Variables ***

#### DATA DRIVEN ####
${ERROR_TEXTBOX}            Please fill out this field.


*** Keywords ***
#### LOGIN DATA DRIVEN ERRORS ####
Error_Empty_Username_Textbox
    [Arguments]             ${error}
    Log                     ${error}
    ${ACTUAL MESSAGE}       Get Element Attribute    name=username    validationMessage
    Should Be Equal         ${ACTUAL MESSAGE}       ${error}

Error_Empty_Password_Textbox_DD
    [Arguments]             ${error}
    Log                     ${error}
    ${ACTUAL MESSAGE}       Get Element Attribute    name=password    validationMessage
    Should Be Equal         ${ACTUAL MESSAGE}       ${error}


#### EMPTY TEXTBOXES ####
Error_Empty_lastname
    ${ACTUAL MESSAGE}       Get Element Attribute    name=lastname    validationMessage
    Should Be Equal         ${ACTUAL MESSAGE}      ${ERROR_TEXTBOX}

Error_Empty_firstname
    ${ACTUAL MESSAGE}       Get Element Attribute    name=firstname    validationMessage
    Should Be Equal         ${ACTUAL MESSAGE}      ${ERROR_TEXTBOX}

Error_Empty_userID
    ${ACTUAL MESSAGE}       Get Element Attribute    name=userid    validationMessage
    Should Be Equal         ${ACTUAL MESSAGE}      ${ERROR_TEXTBOX}

Error_Empty_contactNum
    ${ACTUAL MESSAGE}       Get Element Attribute    name=contactnum    validationMessage
    Should Be Equal         ${ACTUAL MESSAGE}      ${ERROR_TEXTBOX}

Check_Error
    [Arguments]         ${username}        ${password}     ${error}
    Log                 ${error}
    Log                 ${username}
    Run Keyword If  "${error}"=="${ERROR_TEXTBOX}" and "${username}"=="${EMPTY}"          Error_Empty_Username_Textbox       ${error}     
    ...             ELSE IF     "${error}"=="${ERROR_TEXTBOX}" and "${password}"=="${EMPTY}"       Error_Empty_Password_Textbox_DD       ${error}
