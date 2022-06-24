#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo POST DA API Do EndPoint Carrinhos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao


#Sessão para criação de cenários de teste
*** Test Cases ***
Cenario: Cadastrar Carrinho Valido Administrador
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Valido_Administrador
    ${carrinho} =      Gerar Carrinho Valido
    Logar E Salvar Token Como Administrador "true"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Se A Key Nao Esta Vazia "_id"

Cenario: Cadastrar Carrinho Valido Nao Administrador
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Valido_Nao_Administrador
    ${carrinho} =      Gerar Carrinho Valido
    Logar E Salvar Token Como Administrador "false"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Se A Key Nao Esta Vazia "_id"


#Sessão para criação de cenários de teste
*** Test Cases ***
Cenario: Tentar Cadastrar Mais de Um Carrinho
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Mais_De_Um
    ${carrinho} =      Gerar Carrinho Valido
    Logar E Salvar Token Como Administrador "true"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Se A Key Nao Esta Vazia "_id"
    ${carrinho} =      Gerar Carrinho Valido
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "400"
    Validar Mensagem "Não é permitido ter mais de 1 carrinho"

Cenraio: Tentar Cadastrar Carrinho Com Produto Invalido
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Produto_Invalido
    ${carrinho} =      Gerar Carrinho Produto Invalido
    Logar E Salvar Token Como Administrador "false"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "400"
    Validar Mensagem "Produto não encontrado"

Cenario: Tentar Cadastrar Carrinho Com Quantidade Insuficiente
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Quantidade_Insuficiente
    ${carrinho} =      Gerar Carrinho Quantidade Insuficiente
    Logar E Salvar Token Como Administrador "false"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "400"
    Validar Mensagem "Produto não possui quantidade suficiente"

Cenario: Tentar Cadastrar Carrinho Valido Sem Autenticacao
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Valido_Sem_Autenticacao
    ${carrinho} =      Gerar Carrinho Valido
    POST EndPoint "/carrinhos" Com Body "${carrinho}"
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario: Tentar Cadastrar Carrinho Invalido Sem idProduto
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Sem_idProduto
    ${carrinho} =      Gerar Carrinho Invalido Sem "idProduto"
    Logar E Salvar Token Como Administrador "true"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "400"
    Validar "produtos" Com O Valor "produtos não contém 1 valor obrigatório"

Cenario: Tentar Cadastrar Carrinho Invalido Sem Quantidade
    [Tags]      GET     Carrinhos       POST_Carrinhos       Cadastrar_Carrinho_Sem_Quantidade
    ${carrinho} =      Gerar Carrinho Invalido Sem "quantidade"
    Logar E Salvar Token Como Administrador "true"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "400"
    Validar "produtos" Com O Valor "produtos não contém 1 valor obrigatório"


