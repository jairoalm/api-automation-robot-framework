#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Resource        ../support/base.robot
Resource        ../services/ms-usuarios/ms-usuarios.robot
Resource        ../services/ms-login/ms-login.robot

Suite Setup        Criar Sessao

#Sessão para criação dos cenários de teste
*** Test Cases ***

Cenario: POST Realizar Login 200
    [tags]    POSTLOGIN 
    Pegar Dados Login Estatico   
    POST Endpoint /login
    Validar Status Code "200"
    Validar Mensagem "Login realizado com sucesso"

Cenario: POST Realizar Login Dados Estatico
    [tags]    LOGINESTATICO
    Fazer Login e Armazenar Token
