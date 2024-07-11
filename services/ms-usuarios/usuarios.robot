#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquuivo simples para requisições HTTP em APIs REST
Resource    ../../suporte/base.robot

#Sessão para criação de variáveis para utilização
*** Variables ***

#Sessão para criação dos cenários de teste
*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Objetos do Response

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Criar Sessao
    Create Session        serverest    https://serverest.dev

GET Endpoint /usuarios
    ${response}            GET On Session    serverest    /usuarios
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar Objetos do Response
    Should Contain   ${response.json()}.usuarios    quantidade
    Should Contain   ${response.json()}.usuarios    usuarios