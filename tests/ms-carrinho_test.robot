#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Cenários e configurações para ações no carrinho de compra
Resource        ../support/base.robot
Resource        ../services/ms-usuarios/ms-usuarios.robot
Resource        ../services/ms-login/ms-login.robot
Resource        ../services/ms-produtos/ms-produtos.robot
Resource        ../services/carrinho/ms-carrinho.robot

Suite Setup        Criar Sessao

#Sessão para criação dos cenários de teste
*** Test Cases ***

Cenario: POST Adicionar Produto No Carrinho 201
    [tags]    POSTCARRINHO
    Fazer Login e Armazenar Token
    Criar Dados Do Produto
    POST Endpoint /produtos
    Adicionar Produto No Carrinho
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
