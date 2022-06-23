#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo GET DA API Do EndPoint Usuarios
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
#Cenarios de buscas de usuários
Cenario: Listar Todos Os Usuarios Cadastrados
    [Tags]  GET     Listar_Todos
    Get Endpoint "/usuarios"
    Validar Status Code "200"
    Validar Quantidade De Usuarios > 0

Cenario: Buscar Usuario Valido
    [Tags]  GET     Buscar_Usuario_Valido
    ${usuario_valido} =  GET Usuario Valido Administrador "false"
    GET Endpoint "/usuarios/${usuario_valido['_id']}"
    Validar Status Code "200"
    Validar Usuario "${usuario_valido['_id']}"

Cenario: Buscar Usuario Valido Administrador
    [Tags]  GET     Buscar_Usuario_Valido
    ${usuario_valido} =    GET Usuario Valido Administrador "true"
    GET Endpoint "/usuarios/${usuario_valido['_id']}"
    Validar Status Code "200"
    Validar Usuario "${usuario_valido['_id']}"

Cenario: Buscar Usuario Por Id Invalido
    [Tags]  GET     Buscar_Usuario_Invalido
    GET Endpoint "/usuarios/${usuario_nao_cadastrado}"
    Validar Status Code "400"
    Validar Mensagem "Usuário não encontrado"