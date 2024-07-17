#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Library          RequestsLibrary
Resource        ../services/ms-usuarios/ms-usuarios.robot
Resource        ../services/ms-login/ms-login.robot
Resource        ../suporte/common/common_keywords.robot


#Sessão para criação dos cenários de teste
*** Test Cases ***

Cenario: POST Realizar Login 200
    [tags]    POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"