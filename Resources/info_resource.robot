

*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary            locale=en_AU

*** Keywords ***
                #### CREATE ####
Lastname_1
    ${last_name} =          FakerLibrary.last_name
    Input Text              name=lastname          ${last_name}
    Log                     ${last_name}

Firstname_1
    ${first_name} =         FakerLibrary.first_name
    Input Text              name=firstname         ${first_name}
    Log                     ${first_name}

Gender_1
    ${random_Int} =         FakerLibrary.random_Int     min=1       max=2
    Click Element           xpath=//*[@id="myModal"]/div/div/div/div[1]/form/div[3]/div/input[${random_Int}]
    Log                     ${random_Int}

UserID_1
    ${random_number} =      FakerLibrary.random_number      digits=4
    Input Text              name=userid              ${random_number}
    Log                     ${random_number}

College_1
    ${random_Int} =         FakerLibrary.random_Int     min=0       max=4
    ${random}               Convert to String        ${random_Int}
    Select From List by Index       name=coll      ${random}
    Log                     ${random_Int}

Contact_1
    ${random_number} =      FakerLibrary.random_number      digits=11
    Input Text              name=contactnum         ${random_number}
    Log                     ${random_number}

Birthdate_1
    ${date} =               FakerLibrary.date       pattern=%m-%d-%Y     end_datetime=2000
    Input Text              name=birth              ${date}
    Log                     ${date}

Message_1
    ${sentence} =          FakerLibrary.sentence
    Input Text              name=mess               ${sentence}
    Log                     ${sentence}


                #### EDIT ####
Lastname_2
    ${last_name} =          FakerLibrary.last_name
    Clear Element Text      name=lastname
    Input Text              name=lastname          ${last_name}
    Log                     ${last_name}

Firstname_2
    ${first_name} =         FakerLibrary.first_name
    Clear Element Text      name=firstname
    Input Text              name=firstname         ${first_name}
    Log                     ${first_name}

Gender_2
    ${random_Int} =         FakerLibrary.random_Int     min=1       max=2
    Click Element           xpath=/html/body/div/div/form/div[3]/div/input[${random_Int}]
    Log                     ${random_Int}
    

UserID_2
    ${random_number} =      FakerLibrary.random_number      digits=4
    Clear Element Text      name=userid
    Input Text              name=userid              ${random_number}
    Log                     ${random_number}


Contact_2
    ${random_number} =      FakerLibrary.random_number      digits=11
    Clear Element Text      name=contactnum
    Input Text              name=contactnum         ${random_number}
    Log                     ${random_number}

Message_2
    ${sentence} =          FakerLibrary.sentence
    Clear Element Text      name=mess
    Input Text              name=mess               ${sentence}
    Log                     ${sentence}


                #### CHECK DATA ####
Check_lastname
    ${VAL}                  Get Value           name=lastname
    Run Keyword If          '${VAL}'==''        Lastname_1
    ...                     ELSE                Lastname_2

Check_firstname
    ${VAL}                  Get Value           name=firstname
    Run Keyword If          '${VAL}'==''        Firstname_1
    ...                     ELSE                Firstname_2

Check_userID
    ${VAL}                  Get Value           name=userid
    Run Keyword If          '${VAL}'==''        UserID_1
    ...                     ELSE                UserID_2

Check_contact
    ${VAL}                  Get Value           name=contactnum
    Run Keyword If          '${VAL}'==''        Contact_1
    ...                     ELSE                Contact_2

Check_message
    ${VAL}                  Get Value           name=mess
    Run Keyword If          '${VAL}'==''        Message_1
    ...                     ELSE                Message_2


#### CREATE SAVE BUTTON ####
Click_save
    Click Element           xpath=//*[@id="myModal"]/div/div/div/div[1]/form/button


#### EDIT SAVE BUTTON ####
Click_update
    Click Element           xpath=/html/body/div/div/form/button
