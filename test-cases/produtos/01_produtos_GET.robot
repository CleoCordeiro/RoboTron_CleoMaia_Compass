#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo GET Do EndPoint Produtos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
Cenario: Listar Todos Os Produtos Cadastrados
    [Tags]      GET     Listar_Todos_Produtos
    Get Endpoint "/produtos"
    Validar Status Code "200"
    Validar Quantidade De Produtos > 0

Cenario: Buscar Produto Cadastrado
    [Tags]      GET     Buscar_Produto
    Get Endpoint "/produtos/{id}"
    Validar Status Code "200"
    Validar Quantidade De Produtos > 0

Cenario: Buscar Produto Nao Cadastrado
    [Tags]      GET     Buscar_Produto_Nao_Cadastrado
    Get Endpoint "/produtos/{id}"
    Validar Status Code "404"


