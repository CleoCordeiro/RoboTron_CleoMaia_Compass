#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation  Arquivo De Requisições Do Tipo PUT DA API Do EndPoint Usuarios
Resource        ../../resources/resource.resource
Test Setup    Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
#Cenarios de Atualização de dados do usuário
Cenerario: Atualizar Dados de Um Usuario Nao Cadastrado
    [Tags]  PUT    Atualizar    Atualizar_Dados_Usuario_Nao_Cadastrado
    ${usuario} =    Gerar Dados Do Novo Usuario Administrador "false"
    PUT Endpoint "/usuarios/NaoExisto" Com Body "${usuario}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenario: Atualizar Nome Do Usuario
    [Tags]  PUT    Atualizar    Atualizar_Nome_Usuario
    ${usuario} =    GET Usuario Valido Administrador "false"
    ${usuario} =    Alterar "nome" Do Usuario "${usuario}"
    PUT Endpoint "/usuarios/${usuario['_id']}" Com Body "${usuario}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenario: Atualizar Email Do Usuario
    [Tags]  PUT    Atualizar    Atualizar_Email_Usuario
    ${usuario} =    GET Usuario Valido Administrador "false"
    ${usuario} =    Alterar "email" Do Usuario "${usuario}"
    PUT Endpoint "/usuarios/${usuario['_id']}" Com Body "${usuario}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenario: Atualizar Senha Do Usuario
    [Tags]  PUT    Atualizar    Atualizar_Senha_Usuario
    ${usuario} =    GET Usuario Valido Administrador "false"
    ${usuario} =    Alterar "password" Do Usuario "${usuario}"
    PUT Endpoint "/usuarios/${usuario['_id']}" Com Body "${usuario}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenario: Atualizar Privelio Do Usuario
    [Tags]  PUT    Atualizar    Atualizar_Privelio_Usuario
    ${usuario} =    GET Usuario Valido Administrador "false"
    ${usuario} =    Alterar Privilegio do Usuario "${usuario}"
    PUT Endpoint "/usuarios/${usuario['_id']}" Com Body "${usuario}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"
