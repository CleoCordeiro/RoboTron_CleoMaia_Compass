#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo PUT Do EndPoint Produtos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
##################################### Cenario Feliz #####################################
Cenario: Atualizar Produto Não Cadastrado
  
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_NAO_CADASTRADO
    ${produto} =      Pegar Produto Nao Cadastrado
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/NaoExisto" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Se A Key Nao Esta Vazia "_id"

Cenario: Atualizar Nome do Produto
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Nome 
    ${produto} =     Alterar "String" Campo "nome" Do Produto
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenario: Atualizar Descrição do Produto
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Descricao 
    ${produto} =     Alterar "String" Campo "descricao" Do Produto
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenario: Atualizar Preço do Produto
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Preco 
    ${produto} =     Alterar "Integer" Campo "preco" Do Produto
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"

Cenario: Atualizar Quantidade do Produto
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Quantidade 
    ${produto} =     Alterar "Integer" Campo "quantidade" Do Produto
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"


##################################### Cenario Triste #####################################
Cenario: Tentar Atualizar Produto Cadastrado Sem Autenticacao
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Sem_Autenticacao
    ${produto} =      Pegar Produto Cadastrado
    PUT Endpoint "/produtos/${produto['_id']}" Com Body "${produto}"
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario: Tentar Atualizar Produto Autenticado Como Nao Administrador
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Nao_Administrador
    ${produto} =      Pegar Produto Cadastrado
    Logar E Salvar Token Como Administrador "false"
    PUT Autenticado EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"
    
Cenario: Tentar Atualizar Produto Cadastrado Com Token Invalido
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Token_Invalido
    ${produto} =      Pegar Produto Cadastrado
    PUT EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Com Token Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario: Tentar Atualizar Produto Sem Alteracao
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Sem_Alteracao
    ${produto} =       Pegar Produto Cadastrado
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/NaoExisto" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar Mensagem "Já existe produto com esse nome"

Cenario: Tentar Atualizar Produto Com Preco Invalido
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Preco_Invalido
     ${produto} =    Pegar Produto Do JSON Com o Campo "preco" Invalido
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "preco" Com O Valor "preco deve ser um inteiro"

Cenario: Tentar Atualizar Produto Com Quantidade Invalida
    [Tags]      PUT     Produtos       PUT_Produtos    Atualizar_Produto_Quantidade_Invalida
    ${produto} =    Pegar Produto Do JSON Com o Campo "quantidade" Invalido
    Logar E Salvar Token Como Administrador "true"
    PUT Autenticado EndPoint "/produtos/${produto['_id']}" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "quantidade" Com O Valor "quantidade deve ser um inteiro"