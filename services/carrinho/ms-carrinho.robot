#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Resource    ../../support/base.robot

#Sessão para criação de variáveis para utilização
*** Variables ***

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /carrinhos
    ${header}           Create Dictionary    Authorization=${token_auth}
    ${response}        POST On Session        serverest    /carrinhos    json=&{carrinho}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}