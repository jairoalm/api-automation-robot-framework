#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Resource    ../../support/base.robot

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /carrinhos
    ${header}           Create Dictionary    Authorization=${token_auth}
    ${product}          Create Dictionary    idProduto=1V15c17V9RimsiU6   quantidade=12
    Log To Console    Product: ${product}
    &{products_list}    Create List          ${product}
    Log To Console    Product List: ${products_list}
    ${payload}          Create Dictionary    produtos=${products_list} 
    # ${response}         POST On Session        serverest    /carrinhos    json=&{carrinho}    headers=${header}
    Log To Console    Payload: ${products_list}
    ${response}         POST On Session        serverest    /carrinhos    data=${payload}    headers=${header}
    Log To Console    Payload: ${payload}
    Log To Console      Response: ${response.content}
    Set Global Variable    ${response}