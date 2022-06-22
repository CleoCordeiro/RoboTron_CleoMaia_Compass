#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation  Arquivo Que Contem As Keywords Do EndPoint usuarios
Resource    ../resources/resource.resource
Library     Collections
Library     FakerLibrary
Library     String


#Sessão para configuração de variáveis
*** Variables ***
${usuario_nao_cadastrado}    NaoExisto


#Sessão para criação de keywords
*** Keywords ***
GET Usuario Valido
    GET Endpoint "/usuarios"
    Validar Quantidade de Usuarios > 0
    [Return]    ${response_body['usuarios'][0]}

#Criação de um usuário usando a biblioteca Faker
Gerar Dados Do Novo Usuario Administrador "${administrador}"
    ${nome}                          FakerLibrary.Name
    ${email}                         FakerLibrary.Email
    ${senha}                         FakerLibrary.Password
    &{usuario}                       Create Dictionary        nome=${nome}    email=${email}    password=${senha}    administrador=${administrador}
    [Return]                         ${usuario}

Gerar Usuario Com Email Ja Cadastrado
    ${usuario} =    Gerar Dados Do Novo Usuario Administrador "false"
    ${usuario_ja_cadastrado}=   GET Usuario Valido
    Set To Dictionary                ${usuario}                email=${usuario_ja_cadastrado['email']}
    [Return]                         ${usuario}

Gerar Usuario Sem O Campo "${parametro}"
    ${usuario}=  Gerar Dados Do Novo Usuario Administrador "false"
    Remove From Dictionary           ${usuario}                ${parametro}
    [Return]                         ${usuario}

Alterar "${key}" Do Usuario "${usuario}"
    ${novo_usuario} =    Gerar Dados Do Novo Usuario Administrador "false"
    set to dictionary                ${usuario}                ${key}=${novo_usuario.${key}}
    [Return]                         ${usuario}

Alterar Privilegio do Usuario "${usuario}"
    ${administrador}=                Convert To Title Case     ${usuario['administrador']}
    ${administrador} =               Evaluate                  ${administrador}== False
    ${administrador} =               Convert To String         ${administrador}
    ${administrador} =               Convert To Lower Case     ${administrador}
    set to dictionary                ${usuario}                administrador=${administrador}
    [Return]                         ${usuario}

Validar Quantidade De Usuarios ${operador} ${quantidade}
    Should Be True     ${response_body['quantidade']} ${operador} ${quantidade}

Validar Usuario "${id_usuario_cadastrado}"
    Should Be Equal    ${response_body['_id']}    ${id_usuario_cadastrado}
   
Validar Se O Usuario Foi Removido "${usuario['_id']}"
    GET Endpoint "/usuarios/${usuario['_id']}"
    Should Be Equal    ${response_body['message']}    Usuário não encontrado

Validar "${key}" Com O Valor "${value}"
    Should Be Equal    ${response_body['${key}']}    ${value}