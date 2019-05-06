# Navigate the Fotball Page with all 3 user types


*** Settings ***
Library             SeleniumLibrary

*** Variables ***
${URL}              http://localhost/CRUDS-CI/CRUD_control_login
${BROWSER}          Chrome
${DELAY}            1


*** Keywords ***

Navigate_to_Home_Page
    Open Browser            ${URL}      ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed      ${DELAY}
    ${Title}                Get Title
    Log                     ${Title}

Navigate_to_create
    Click Element           xpath=/html/body/div/button

Navigate_to_delete
    ${random_Int} =         FakerLibrary.random_Int     min=1       max=5
    Click Element           xpath=/html/body/div/table/tbody/tr[${random_Int}]/td[10]/a[2]
    Log                     ${random_Int}
    
Navigate_to_Edit
    ${random_Int} =         FakerLibrary.random_Int     min=1       max=5
    Click Element           xpath=/html/body/div/table/tbody/tr[${random_Int}]/td[10]/a[1]
    Log                     ${random_Int}

Navigate_to_Logout
    Click Element           xpath=/html/body/nav/a[2]