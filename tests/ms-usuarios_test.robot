#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Library          RequestsLibrary
Resource        ../services/ms-usuarios/usuarios.robot


#Sessão para criação dos cenários de teste
*** Test Cases ***
Cenario: GET Todos os Usuarios 200
    [tags]    GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Objetos do Response
    #Validar Quantidade "1"
    Printar Conteudo Response

Cenario: POST Cadastrar Usuario 201
    [tags]    POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"    

Cenario: PUT Editar Usuario 200
    [tags]    PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"    

Cenario: DELETE Deletar Usuario 200
    [tags]    DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200" 