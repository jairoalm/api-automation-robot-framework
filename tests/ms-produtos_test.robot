#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Library          RequestsLibrary
Resource        ../services/ms-usuarios/ms-usuarios.robot
Resource        ../services/ms-login/ms-login.robot
Resource        ../services/ms-produtos/ms-produtos.robot
Resource        ../suporte/common/common_keywords.robot


#Sessão para criação dos cenários de teste
*** Test Cases ***

Cenario: POST Criar Produto 201
    [tags]    POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [tags]    DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar Um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"    
    Validar Ter Excluido Produto
    