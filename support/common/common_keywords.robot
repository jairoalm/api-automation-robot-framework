#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Resource         ../../support/base.robot

#Sessão para criação de variáveis para utilização
*** Variables ***

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Validar Mensagem "${mensagem}"
    Should Contain    ${response.json()["message"]}    ${mensagem}

# Validar Quantidade "${quantidade}"
#     Should Be Equal    ${response.json()["quantidade"]}    ${quantidade}

Printar Conteudo Response
    # Log To Console    response: ${response.json()}
    Log To Console    Nome: &{response.json()["usuarios"][2]["nome"]}
    # Log To Console    Nome: &{response.json}

Validar Objetos do Response
    Should Contain   ${response.json()}.usuarios    quantidade
    Should Contain   ${response.json()}.usuarios    usuarios

# Pegando arquivo massa dentro de um arquivo .json
Importar Json Estatico
    [Arguments]    ${nome_arquivo}
    ${arquivo}    Get File    ${EXECDIR}/support/factory/static/hml/${nome_arquivo}    
    ${data}        Evaluate    json.loads('''${arquivo}''')    json
    RETURN        ${data}    