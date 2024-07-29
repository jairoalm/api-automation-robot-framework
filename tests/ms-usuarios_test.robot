#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Resource        ../support/base.robot
Resource        ../services/ms-usuarios/ms-usuarios.robot

# Antes de executar os cenários crie um sessão
Suite Setup        Criar Sessao

# Quando finalizar todos os testes execute ele
# Suite Teardown

#Sessão para criação dos cenários de teste
*** Test Cases ***
# Cenario: POST Cadastrar Usuario 201
#     [tags]    POST   
#     Criar Dados Do Usuario 
#     POST Endpoint /usuarios
#     Validar Status Code "201"
#     Validar Mensagem "Cadastro realizado com sucesso"

Cenario: POST Cadastrar Usuario De Massa Dinamica 201
    [tags]    POSTDINAMICO
     Criar Dados Do Usuario
     POST Endpoint /usuarios
     Validar Status Code "201"
     Validar Mensagem "Cadastro realizado com sucesso"

Cenario: GET Todos os Usuarios 200
    [tags]    GET   
    GET Endpoint /usuarios
    Validar Status Code "200"
    Validar Objetos do Response 

Cenario: PUT Editar Usuario 200
    [tags]    PUT   
    Criar Dados Do Usuario
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"    

Cenario: DELETE Deletar Usuario 200
    [tags]    DELETE
    Criar Dados Do Usuario
    POST Endpoint /usuarios    
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST Validar Usuario Já Cadastrado Com Massa Estatica 400
    [tags]    USERCADASTRADO     
    Pegar Dados Usuario Estatico Valido "user_valido"
    POST Endpoint /usuarios
    # Validar Status Code "400"
    Validar Mensagem "Este email já está sendo usado"