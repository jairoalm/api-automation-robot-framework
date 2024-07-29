*** Settings ***
Documentation         Fábrica de Dados Dinâmicos
Resource              ../../support/base.robot    # robotcode: ignore

*** Keywords ***

Criar Dados Do Usuario
    ${nome}                            FakerLibrary.Name
    ${email}                           FakerLibrary.Email
    ${password}                        FakerLibrary.Password
    ${payload}                         Create Dictionary    nome=${nome}    email=${email}    password=${password}    administrador=true
    Log To Console                     ${payload}
    Set Global Variable                ${payload}

Criar Dados Do Produto
    ${nome}                   FakerLibrary.Company
    ${preco}                  FakerLibrary.Day Of Month
    ${descricao}              FakerLibrary.Country
    ${quantidade}             FakerLibrary.Day Of Month    
    ${product_payload}              Create Dictionary    nome=${nome}    preco=${preco}    descricao=${descricao}    quantidade=${quantidade}    
    Log To Console                     ${product_payload}
    Set Global Variable                ${product_payload}
    # RETURN                    ${product_payload}

Adicionar Produto No Carrinho
    ${id_product}            Set Variable    ${id_produto}
    ${carrinho}              Create Dictionary    idProduto=${id_product}    quantidade=1
    Log To Console           ${carrinho}
    Set Global Variable      ${carrinho}