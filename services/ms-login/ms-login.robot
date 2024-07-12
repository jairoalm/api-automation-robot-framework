#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Variaveis e ação de login
Library        FakerLibrary
Resource    ../../suporte/base.robot
Resource    ../../suporte/factory/dynamic.robot
Resource    ../../tests/ms-login_test.robot

#Sessão para criação de variáveis para utilização
*** Variables ***
${email_para_login}    wchang@example.com  
${password_para_login}    wD1rNVRx6      

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /login
    ${response}            POST On Session    serverest    /login
    &{payload}            Create Dictionary        email=${email_para_login}    password=${password_para_login}
    ${response}        POST On Session        serverest    /login        data=&{payload}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}