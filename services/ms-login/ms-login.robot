#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Keywords e ações do login
Resource    ../../support/base.robot

#Sessão para criação de variáveis para utilização
*** Variables ***
# nome do usuário "Richard"
# ${email_para_login}    virginiadunn@example.com  
# ${password_para_login}    A%z5DOcoI1      

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /login
    # ${response}            POST On Session    serverest    /login
    # &{payload}            Create Dictionary        email=${email_para_login}    password=${password_para_login}
    ${response}        POST On Session        serverest    /login        json=&{payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Pegar Dados Login Estatico
    ${json}                Importar JSON Estatico        login.json
    ${payload}             Set Variable        ${json["user_login_cadastrado"]}
    Set Global Variable    ${payload}
    # POST Endpoint /login

Fazer Login e Armazenar Token
    Pegar Dados Login Estatico
    POST Endpoint /login
    ${token_auth}        Set Variable    ${response.json()["authorization"]}
    Log To Console        Token Salvo: ${token_auth}
    Set Global Variable    ${token_auth}