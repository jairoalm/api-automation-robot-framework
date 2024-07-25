*** Settings ***
Documentation         Fábrica de Dados Dinâmicos
Resource              ../../support/base.robot    # robotcode: ignore

*** Keywords ***

Criar Dados Do Usuario
    ${nome}                            FakerLibrary.Name
    ${email}                           FakerLibrary.Email
    ${password}                        FakerLibrary.Password
    ${payload}                         Create Dictionary    nome=${nome}    email=${email}    password=${password}    administrador=true
    Log To Console                     ${payload}
    Set Global Variable                ${payload}

# Generate Valid Product Data
#     # ${first_name}           FakerLibrary.Firstname
#     # ${email}            FakerLibrary.Email
#     # ${password}             FakerLibrary.Password
#     # ${user_data}            Create Dictionary    nome=${first_name}    email=${email}    password=${password}    administrador=true    
#     # RETURN                ${user_data}