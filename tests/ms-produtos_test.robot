#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Resource        ../support/base.robot
Resource        ../services/ms-usuarios/ms-usuarios.robot
Resource        ../services/ms-login/ms-login.robot
Resource        ../services/ms-produtos/ms-produtos.robot

Suite Setup        Criar Sessao

#Sessão para criação dos cenários de teste
*** Test Cases ***

Cenario: POST Criar Produto 201
    [tags]    POSTPRODUTO    
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [tags]    DELETEPRODUTOs    
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"    
    Validar Ter Excluido Produto
    