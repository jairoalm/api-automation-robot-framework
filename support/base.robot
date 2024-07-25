#Sessão para configuração, documentação, imports de arquivos e library
*** Settings ***
Documentation    Configurações globais do projeto
Library          RequestsLibrary
Library          Collections
Library          OperatingSystem
Library          FakerLibrary
Resource         ../support/common/common_keywords.robot
Resource         ./factory/dynamic.robot
Resource         ./variaveis/serverest_variaveis.robot


#Sessão para criação de variáveis globais para utilização
*** Variables ***


*** Keywords ***
Criar Sessao
    # Create Session        serverest    https://serverest.dev
    Create Session        serverest    ${BASE_URI}