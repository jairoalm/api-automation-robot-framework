*** Settings ***
Documentation         Fábrica de Dados Dinâmicos
Library               FakerLibrary
Resource              ../base.robot

*** Keywords ***

Generate Valid User Data
    ${first_name}           FakerLibrary.Firstname
    ${email}            FakerLibrary.Email
    ${password}             FakerLibrary.Password
    ${user_data}            Create Dictionary    nome=${first_name}    email=${email}    password=${password}    administrador=true    
    RETURN                ${user_data}

# Generate Valid Product Data
#     # ${first_name}           FakerLibrary.Firstname
#     # ${email}            FakerLibrary.Email
#     # ${password}             FakerLibrary.Password
#     # ${user_data}            Create Dictionary    nome=${first_name}    email=${email}    password=${password}    administrador=true    
#     # RETURN                ${user_data}