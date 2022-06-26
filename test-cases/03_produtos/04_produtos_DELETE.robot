#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo DELETE Do EndPoint Produtos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
##################################### Cenario Feliz #####################################
Cenario: Deletar Produto Cadastrado
    [Tags]      DELETE     Produtos       DELETE_Produtos     Deletar_Produto_Cadastrado
    ${produto}=   Cadastar Novo Produto
    Logar E Salvar Token Como Administrador "true"
    DELETE Autenticado EndPoint "/produtos/${produto['_id']}" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"

##################################### Cenario Triste #####################################
Cenario: Tentar Deletar Produto Não Cadastrado
    [Tags]      DELETE     Produtos       DELETE_Produtos     Deletar_Produto_Nao_Cadastrado
    Logar E Salvar Token Como Administrador "true"
    DELETE Autenticado EndPoint "/produtos/NaoExisto" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Nenhum registro excluído"

Cenario: Tentar Deletar Produto Cadastrado Sem Autenticacao
    [Tags]      DELETE     Produtos       DELETE_Produtos     Deletar_Produto_Sem_Autenticacao
    ${produto}=   Cadastar Novo Produto
    DELETE Endpoint "/produtos/${produto['_id']}"
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario: Tentar Deletar Produto Cadastrado Com Autenticacao De Nao Administrador
    [Tags]      DELETE     Produtos       DELETE_Produtos     Deletar_Produto_Nao_Administrador
    ${produto}=   Cadastar Novo Produto
    Logar E Salvar Token Como Administrador "false"
    DELETE Autenticado EndPoint "/produtos/${produto['_id']}" Headers "${headers}"
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"