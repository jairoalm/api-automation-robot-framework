#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Library          RequestsLibrary
Resource        ../services/ms-usuarios/ms-usuarios.robot
Resource        ../services/ms-login/ms-login.robot
Resource        ../services/ms-produtos/ms-produtos.robot


#Sessão para criação dos cenários de teste
*** Test Cases ***

Cenario: POST Criar Produto 201
    [tags]    POSTPRODUTO
    Criar Sessao
    POST Endpoint /produtos
    Validar Status Code "201"