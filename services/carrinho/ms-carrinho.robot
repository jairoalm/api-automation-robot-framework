#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Resource    ../../support/base.robot

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /carrinhos
    ${header}           Create Dictionary    Authorization=${token_auth}   
    ${response}         POST On Session        serverest    /carrinhos    json=${payload}    headers=${header}
    # Log To Console      Payload: ${payload}
    Log To Console      Response: ${response.content}
    ${id_carrinho}=     Get From Dictionary    ${response.json()}    _id
    Set Global Variable    ${id_carrinho}
    Set Global Variable    ${response}

DELETE endpoint /carrinhos
    ${header}           Create Dictionary    Authorization=${token_auth}
    Log To Console    ${header}   
    ${response}         DELETE On Session        serverest    /carrinhos/cancelar-compra    headers=${header}
    Log To Console      Response: ${response.content}
    Set Global Variable    ${response} 