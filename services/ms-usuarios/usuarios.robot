#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Library        FakerLibrary
Resource    ../../suporte/base.robot
Resource    ../../suporte/factory/dynamic.robot

#Sessão para criação de variáveis para utilização
*** Variables ***
# ${nome}=    FakerLibrary.First Name
# ${email}=    FakerLibrary.Email
# ${password}=    FakerLibrary.Password

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Criar Sessao
    Create Session        serverest    https://serverest.dev

GET Endpoint /usuarios
    ${response}            GET On Session    serverest    /usuarios
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
##05
POST Endpoint /usuarios    
    ${nome}=    FakerLibrary.First Name
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password
    # ${user_data}=    Generate Valid User Data
    # Set Global Variable    ${User_data}
    # ${payload}=    Evaluate    json.dumps(${user_data})
    # Set Global Variable    ${payload}        
    &{payload}            Create Dictionary        nome=${nome}    email=${email}    password=${password}    administrador=true
    ${response}        POST On Session        serverest    /usuarios        data=&{payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios  
    ${nome}=    FakerLibrary.First Name
    ${email}=    FakerLibrary.Email
    ${password}=    FakerLibrary.Password  
    &{payload}            Create Dictionary        nome=${nome}    email=${email}    password=${password}    administrador=true
    ${response}        PUT On Session        serverest    /usuarios/${response.json()["_id"]}        data=&{payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}        DELETE On Session        serverest    /usuarios/${response.json()["_id"]}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar Objetos do Response
    Should Contain   ${response.json()}.usuarios    quantidade
    Should Contain   ${response.json()}.usuarios    usuarios

# Validar Quantidade "${quantidade}"
#     Should Be Equal    ${response.json()["quantidade"]}    ${quantidade}

Validar Mensagem "${mensagem}"
    Should Contain    ${response.json()["message"]}    ${mensagem}

Printar Conteudo Response
    # Log To Console    response: ${response.json()}
    Log To Console    Nome: &{response.json()["usuarios"][0]["nome"]}