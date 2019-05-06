*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary            locale=en_AU


*** Keywords ***
Bad_lastname_SPC
    ${password} =       FakerLibrary.password
    Input Text          name=lastname               ${password}
    Log                 ${password}

Bad_firstname_SPC
    ${password} =       FakerLibrary.password
    Input Text          name=firstname                    ${password}
    Log                 ${password}

Bad_userid_number
    ${random_number} =     FakerLibrary.random_number     digits=10
    Input Text          name=userid                       ${random_number}
    Log                 ${random_number}

Bad_userid_SPC
    ${password} =       FakerLibrary.password
    Input Text          name=userid                       ${password}
    Log                 ${password}

Bad_contact_number
    ${random_number} =     FakerLibrary.random_number     digits=20
    Input Text          name=contactnum                   ${random_number}
    Log                 ${random_number}

Bad_contact_SPC
    ${password} =       FakerLibrary.password
    Input Text          name=contactnum                   ${password}
    Log                 ${password}