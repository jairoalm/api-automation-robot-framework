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

Cenario: POST Cadastrar Produto 201
    [tags]    POSTPRODUTO    
    Fazer Login e Armazenar Token
    Criar Dados Do Produto
    POST Endpoint /produtos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenário: GET Listar Todos Os Produtos
    [Tags]    GETLISTARPRODUTOS
    GET Endpoint /produtos
    Validar Objetos Response Do Produto
    Validar Status Code "200"

Cenário: GET Listar Produto Por ID
    [Tags]    GETID
    GET Endpoint /produtos "_id=A4OmANwGb5fsnLrj"
    Validar Status Code "200"

Cenário: GET Listar Produto Por Nome
    [Tags]    GETNOME
    GET Endpoint /produtos "nome=Norris-Hill"
    Validar Status Code "200"

Cenário: GET Listar Produto Por Preco
    [Tags]    GETPRECO
    GET Endpoint /produtos "preco=10"
    Validar Status Code "200"

Cenário: GET Listar Produto Por Descricao
    [Tags]    GETDESCRICAO
    GET Endpoint /produtos "descricao=Paraguay"
    Validar Status Code "200"

Cenário: GET Listar Produto Por Quantidade
    [Tags]    GETQUANTIDADE
    GET Endpoint /produtos "quantidade=2"
    Validar Status Code "200"

Cenario: DELETE Excluir Produto 200
    [tags]    DELETEPRODUTOS    
    Fazer Login e Armazenar Token
    Criar Dados Do Produto
    POST Endpoint /produtos
    DELETE Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"

Cenario: Tentar criar um novo Produto com o campo Nome vazio
    [Documentation]     Tentar criar um novo Produto com o campo "nome" preenchido incorretamente
    [Tags]  regression   
    Fazer Login e Armazenar Token
    Fazer uma requisição POST na rota e campo "nome" com valor "vazio" no cadastro
    Validar Status Code "400"
    Validar Mensagem "nome não pode ficar em branco"