#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Resource         ../../support/base.robot

#Sessão para criação de variáveis
*** Variables ***

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
GET Endpoint /usuarios
    ${response}            GET On Session    serverest    /usuarios
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
##05
POST Endpoint /usuarios
    ${response}        POST On Session        serverest    /usuarios        json=&{payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint /usuarios  
    ${response}        PUT On Session        serverest    /usuarios/${response.json()["_id"]}        json=&{payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /usuarios
    ${response}        DELETE On Session        serverest    /usuarios/${response.json()["_id"]}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Pegar Dados Usuario Estatico Valido "${user_data}"
    ${json}                Importar JSON Estatico        usuario.json
    ${payload}             Set Variable        ${json["${user_data}"]}
    Log To Console    Payload: ${payload}
    Set Global Variable    ${payload}
    # POST Endpoint /usuarios