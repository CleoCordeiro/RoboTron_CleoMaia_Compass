#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo GET DA API Do EndPoint Carrinhos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
##################################### Cenario Feliz #####################################
Cenario: Listar Todos Os Carrinhos Cadastrados
    [Tags]      GET     Carrinhos       GET_Carrinhos       Buscar_Todos_Carrinhos
    Cadastrar Novo Carrinho
    Get Endpoint "/carrinhos"
    Validar Status Code "200"
    Validar Quantidade De Carrinhos > 0

Cenario: Buscar Carrinho Cadastrado
    [Tags]      GET     Carrinhos       GET_Carrinhos       Buscar_Carrinho_Cadastrado
    Cadastrar Novo Carrinho
    ${carrinho} =  Pegar Carrinho Cadastrado
    Get Endpoint "/carrinhos?_id=${carrinho['_id']}&precoTotal=${carrinho['precoTotal']}&quantidadeTotal=${carrinho['quantidadeTotal']}&idUsuario=${carrinho['idUsuario']}"
    Validar Status Code "200"
    Validar Quantidade De Carrinhos > 0

##################################### Cenario Triste #####################################
Cenario: Tentar Buscar Carrinho Nao Cadastrado
    [Tags]      GET     Carrinhos       GET_Carrinhos       Buscar_Carrinho_Nao_Cadastrado
    Get Endpoint "/carrinhos/NaoCadastrado"
    Validar Status Code "400"
    Validar Mensagem "Carrinho não encontrado"