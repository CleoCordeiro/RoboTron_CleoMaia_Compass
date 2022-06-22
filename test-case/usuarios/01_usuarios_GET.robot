#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo GET DA API Do EndPoint Usuarios
Resource        usuarios_keywords.robot
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
#Cenarios de buscas de usuários
Cenario: GET Todos Os Usuarios Cadastrados
    [Tags]  GET     Listar_Todos
    Get Endpoint "/usuarios"
    Validar Status Code "200"
    Validar Quantidade De Usuarios > 0

Cenario: GET Usuario Valido
    [Tags]  GET     Buscar_Por_Id
    ${usuario_valido} =    GET Usuario Valido
    GET Endpoint "/usuarios/${usuario_valido['_id']}"
    Validar Status Code "200"
    Validar Usuario "${usuario_valido['_id']}"

Cenario: Buscar Usuario Por Id Invalido
    [Tags]  GET     Buscar_Por_Id_Invalido
    GET Endpoint "/usuarios/${usuario_nao_cadastrado}"
    Validar Status Code "400"
    Validar Mensagem "Usuário não encontrado"