#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation  Arquivo De Requisições Do Tipo DELETE DA API Do EndPoint Usuarios
Resource        usuarios_keywords.robot
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
Cenario: Deletar Usuario Cadastrado
    [Tags]  DELETE    Deletar_Usuario_Cadastrado
    ${usuario} =    GET Usuario Valido
    DELETE Endpoint "/usuarios/${usuario['_id']}"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"
    Validar Se O Usuario Foi Removido "${usuario['_id']}"


Cenario: Deletar Usuario Nao Cadastrado
    [Tags]  DELETE    Deletar_Usuario_Nao_Cadastrado
    DELETE Endpoint "/usuarios/${usuario_nao_cadastrado}"
    Validar Status Code "200"
    Validar Mensagem "Nenhum registro excluído"