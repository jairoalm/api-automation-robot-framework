#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Library        FakerLibrary
Library        OperatingSystem
Resource    ../../suporte/base.robot
Resource    ../../suporte/factory/dynamic.robot

#Sessão para criação de variáveis para utilização
*** Variables ***
# ${nome}=    FakerLibrary.First Name
# ${email}=    FakerLibrary.Email
# ${password}=    FakerLibrary.Password

#Sessão para criação de Keywords Personalizadas
*** Keywords ***
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

Importar Json Estatico
    [Arguments]    ${nome_arquivo}
    ${arquivo}    Get File    ${EXECDIR}/${nome_arquivo}    
    ${data}        Evaluate    josn.loads('''${arquivo}''')    json
    [RETURN]        ${data}    