#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo GET Do EndPoint Produtos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
##################################### Cenario Feliz #####################################
Cenario: Listar Todos Os Produtos Cadastrados
    [Tags]      GET     Produtos       GET_Produtos   Buscar_Todos_Produtos
    Cadastar Novo Produto
    Get Endpoint "/produtos"
    Validar Status Code "200"
    Validar Quantidade De Produtos > 0

Cenario: Buscar Produto Cadastrado
    [Tags]      GET     Produtos       GET_Produtos      Buscar_Produto_Cadastrado
    Cadastar Novo Produto
    ${produto} =  Pegar Produto Cadastrado
    Get Endpoint "/produtos/${produto['_id']}"
    Validar Status Code "200"
    Validar Quantidade De Produtos > 0

##################################### Cenario Triste #####################################
Cenario: Tentar Buscar Produto Nao Cadastrado
    [Tags]      GET     Produtos       GET_Produtos      Buscar_Produto_Nao_Cadastrado
    Get Endpoint "/produtos/NaoCadastrado"
    Validar Status Code "400"
    Validar Mensagem "Produto não encontrado"


