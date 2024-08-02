#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Resource    ../../support/base.robot

#Sessão para criação de variáveis para utilização
*** Variables ***

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /produtos    
    # Criar o header com o token de autenticação
    ${header}           Create Dictionary    Authorization=${token_auth}
    # Enviar a requisição POST usando o payload como JSON
    ${response}         POST On Session    serverest    /produtos        json=${product_payload}    headers=${header}
    Log To Console      Response: ${response.content}
    # Armazenar a resposta e o ID do produto
    Set Global Variable    ${response}
    ${id_produto}=      Get From Dictionary    ${response.json()}    _id
    Set Global Variable    ${id_produto}

DELETE Endpoint /produtos
    ${header}           Create Dictionary    Authorization=${token_auth}
    ${response}        DELETE On Session        serverest    /produtos/${response.json()["_id"]}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

# Criar Um Produto e Armazenar ID
#     POST Endpoint /produtos
#     Validar Ter Criado Produdo
#     ${id_produto}        Set Variable        ${response.json()["_id"]}
#     Log To Console        ID Produto: ${id_produto}
#     Set Global Variable    ${id_produto}

GET Endpoint /produtos
    ${response}            GET On Session    serverest    /produtos
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

GET Endpoint /produtos "${object}"
    ${response}            GET On Session    serverest    /produtos?${object}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}    

Validar Que Objetos Response Existem
    Should Not Be Empty            ${response.json()["message"]}
    Should Not Be Empty            ${response.json()["_id"]} 

Validar Objetos Response Do Produto
    Should Not Be Empty        ${response.json()["produtos"]}

Fazer uma requisição POST na rota e campo "${attribute}" com valor "${value}" no cadastro    
    ${payload}    Criar Dados Do Produto
    Run Keyword If    '${value}' == "vazio"     Set to Dictionary    ${payload}    ${attribute}=${EMPTY}
    ...     ELSE       Set to Dictionary    ${payload}    ${attribute}=${value}
    ${payload_json}=    Evaluate    json.dumps(${payload})
    Set Global Variable    ${payload_json}
    Log To Console    Valor vazio= ${payload_json}    
    ${header}           Create Dictionary    Authorization=${token_auth}
    ${response}        POST On Session        serverest    /produtos    json=${payload_json}    headers=${header}