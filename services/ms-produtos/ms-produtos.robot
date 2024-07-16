#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Arquivo simples para requisições HTTP em APIs REST
Library          RequestsLibrary

#Sessão para criação de variáveis para utilização
*** Variables ***
${token_auth}        Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpcmdpbmlhZHVubkBleGFtcGxlLmNvbSIsInBhc3N3b3JkIjoiQSV6NURPY29JMSIsImlhdCI6MTcyMTE2MzQxNiwiZXhwIjoxNzIxMTY0MDE2fQ.l_B341O82IUzf3qunBXiHNW8pClU3PZjMp8TMAX-MAM

#Sessão para criação de Keywords Personalizadas
*** Keywords ***

POST Endpoint /produtos
    ${header}           Create Dictionary    Authorization=${token_auth}   
    &{payload}            Create Dictionary        nome=MouseTech    preco=400    descricao=Mouse    quantidade=5
    ${response}        POST On Session        serverest    /produtos        data=&{payload}    headers=${header}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

# "authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InZpcmdpbmlhZHVubkBleGFtcGxlLmNvbSIsInBhc3N3b3JkIjoiQSV6NURPY29JMSIsImlhdCI6MTcyMTE1ODY4MywiZXhwIjoxNzIxMTU5MjgzfQ.rvGfsd09ffoiBccb27SOumnxyUAURWzSyEj-h1pOB5E"