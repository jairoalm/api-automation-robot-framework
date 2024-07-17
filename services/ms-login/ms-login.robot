#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Variaveis e ação de login
Library        FakerLibrary
Resource    ../../suporte/base.robot
Resource    ../../suporte/factory/dynamic.robot
Resource    ../../tests/ms-login_test.robot

#Sessão para criação de variáveis para utilização
*** Variables ***
# nome do usuário "Richard"
${email_para_login}    virginiadunn@example.com  
${password_para_login}    A%z5DOcoI1      

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /login
    # ${response}            POST On Session    serverest    /login
    &{payload}            Create Dictionary        email=${email_para_login}    password=${password_para_login}
    ${response}        POST On Session        serverest    /login        data=&{payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}
    
Validar Ter Logado
    Should Be Equal        ${response.json()["message"]}    Login realizado com sucesso
    Should Not Be Empty    ${response.json()["authorization"]}            

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Ter Logado
    ${token_auth}        Set Variable    ${response.json()["authorization"]}
    Log To Console        Token Salvo: ${token_auth}
    Set Global Variable    ${token_auth}