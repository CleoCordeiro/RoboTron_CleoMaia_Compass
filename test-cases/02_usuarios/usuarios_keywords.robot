#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation  Arquivo Que Contem As Keywords Do EndPoint usuarios


#Sessão para configuração de variáveis
*** Variables ***
${usuario_nao_cadastrado}    NaoExisto


#Sessão para criação de keywords
*** Keywords ***
GET Usuario Por ID "${_id}"
    GET Endpoint "/usuarios/${_id}"
    Validar Status Code "200"
    [Return]    ${response_body}

Cadastrar Novo Usuario Administrador "${administrador}"
    ${usuario} =    Gerar Dados Do Novo Usuario Administrador "${administrador}"
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    Should Not Be Empty     ${response_body['_id']}
    Set To Dictionary          ${usuario}          _id=${response_body['_id']}
    [Return]   ${usuario}

#Criação de um usuário usando a biblioteca Faker
Gerar Dados Do Novo Usuario Administrador "${administrador}"
    ${nome}                          FakerLibrary.Name
    ${email}                         FakerLibrary.Email
    ${word}                          FakerLibrary.Word
    ${email}                         Catenate                 SEPARATOR=      ${word}           ${email}      
    ${senha}                         FakerLibrary.Password
    &{usuario}                       Create Dictionary        nome=${nome}    email=${email}    password=${senha}    administrador=${administrador}
    [Return]                         ${usuario}

Gerar Usuario Com Email Ja Cadastrado
    ${usuario} =    Gerar Dados Do Novo Usuario Administrador "false"
    ${usuario_ja_cadastrado}=   Cadastrar Novo Usuario Administrador "false"
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

Validar Usuario "${id_usuario_cadastrado}"
    Should Be Equal    ${response_body['_id']}    ${id_usuario_cadastrado}
   
Validar Se O Usuario Foi Removido "${usuario['_id']}"
    GET Endpoint "/usuarios/${usuario['_id']}"
    Should Be Equal    ${response_body['message']}    Usuário não encontrado

Validar "${key}" Com O Valor "${value}"
    Should Be Equal    ${response_body['${key}']}    ${value}