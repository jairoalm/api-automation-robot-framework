#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Library          RequestsLibrary
Resource    ../../suporte/base.robot

#Sessão para criação de variáveis para utilização
*** Variables ***

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /produtos
    ${nome}=    FakerLibrary.Company
    ${preco}=    FakerLibrary.Day Of Month
    ${descricao}=    FakerLibrary.Country
    ${quantidade}=    FakerLibrary.Day Of Month
    ${header}           Create Dictionary    Authorization=${token_auth}   
    &{payload}            Create Dictionary        nome=${nome}    preco=20    descricao=${descricao}    quantidade=${quantidade}
    ${response}        POST On Session        serverest    /produtos        data=&{payload}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint /produtos
    ${header}           Create Dictionary    Authorization=${token_auth}
    ${response}        DELETE On Session        serverest    /produtos/${id_produto}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Criar Um Produto e Armazenar ID
    POST Endpoint /produtos
    Validar Ter Criado Produdo
    ${id_produto}        Set Variable        ${response.json()["_id"]}
    Log To Console        ID Produto: ${id_produto}
    Set Global Variable    ${id_produto}
    

Validar Ter Criado Produdo
    Should Be Equal        ${response.json()["message"]}    Cadastro realizado com sucesso
    Should Not Be Empty    ${response.json()["_id"]} 

Validar Ter Excluido Produto
    Should Be Equal        ${response.json()["message"]}    Registro excluído com sucesso