#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation  Arquivo De Requisições Do Tipo POST DA API Do EndPoint Usuarios
Resource        ../../resources/resource.resource
Test Setup    Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
#Cenarios de realização de cadastros de usuários
Cenario: Cadastrar Um Usuario Administrador Com Sucesso
    [Tags]      POST     Usuarios       POST_Usuarios   Cadastrar_Usuario_Administrador
    ${usuario} =    Gerar Dados Do Novo Usuario Administrador "true"
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

Cenario: Cadastrar Um Usuario Nao Administrador Com Sucesso
    [Tags]      POST     Usuarios       POST_Usuarios    Cadastrar_Usuario
    ${usuario} =    Gerar Dados Do Novo Usuario Administrador "false"
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"

#Cenario de realização de cadastro com email já cadastrado
Cenario: Tentativa de Cadastrar Um Usuario Com Email Ja Cadastrado
    [Tags]      POST     Usuarios       POST_Usuarios    Cadastrar_Usuario_Email_Ja_Utilizado
    ${usuario} =    Gerar Usuario Com Email Ja Cadastrado
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "400"
    Validar Mensagem "Este email já está sendo usado"


#Cenarios de realização de cadastros faltando dados
Cenario: Tentativa de Cadastrar Um Usuario Sem Nome
    [Tags]      POST     Usuarios       POST_Usuarios    Cadastrar_Usuario_Sem_Nome
    ${usuario} =    Gerar Usuario Sem O Campo "nome"
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "400"
    Validar "nome" Com O Valor "nome é obrigatório"

Cenario: Tentativa de Cadastrar Um Usuario Sem Email
    [Tags]      POST     Usuarios       POST_Usuarios    Cadastrar_Usuario_Sem_Email
    ${usuario} =    Gerar Usuario Sem O Campo "email"
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "400"
    Validar "email" Com O Valor "email é obrigatório"

Cenario: Tentativa de Cadastrar Um Usuario Sem Senha
    [Tags]      POST     Usuarios       POST_Usuarios    Cadastrar_Usuario_Sem_Senha
    ${usuario} =    Gerar Usuario Sem O Campo "password"
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "400"
    Validar "password" Com O Valor "password é obrigatório"

Cenario: Tentativa de Cadastrar Um Usuario Sem Administrador
    [Tags]      POST     Usuarios       POST_Usuarios    Cadastrar_Usuario_Sem_Administrador
    ${usuario} =    Gerar Usuario Sem O Campo "administrador"
    POST Endpoint "/usuarios" Com Body "${usuario}"
    Validar Status Code "400"
    Validar "administrador" Com O Valor "administrador é obrigatório"
