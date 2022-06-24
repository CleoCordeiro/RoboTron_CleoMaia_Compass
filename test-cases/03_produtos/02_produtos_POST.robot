#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo POST Do EndPoint Produtos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao


#Sessão para criação de cenários de teste
*** Test Cases ***
##################################### Cenario Feliz #####################################
Cenario: Cadastrar Produto Valido
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Valido
    ${produto} =    Pegar Produto Nao Cadastrado
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Status Code "201"
    Validar Se A Key Nao Esta Vazia "_id"

Cenario: Cadastrar 20 Produtos    
    [Tags]      POST     Produtos       POST_Produtos      Cadastar_20_Produtos
   ${produtos} =       Importar JSON  produtos.json
   ${quantidade_json} =  Get Length  ${produtos['produtos']}
   ${quantidade_ja_cadastrada} =     Quantidade De Produtos
   Logar E Salvar Token Como Administrador "true"
   FOR    ${i}    IN RANGE   20
       IF  ${quantidade_ja_cadastrada}+${i} >= ${quantidade_json}    Log to Console    Não Existem Mais Produtos Para Cadastrar
       Exit For Loop IF  ${quantidade_ja_cadastrada}+${i} >= ${quantidade_json}
       POST Autenticado EndPoint "/produtos" Com Body "${produtos['produtos'][${quantidade_ja_cadastrada}+${i}]}" Headers "${headers}"
       Validar Mensagem "Cadastro realizado com sucesso"
       Validar Status Code "201"
       Validar Se A Key Nao Esta Vazia "_id"
   END
  
##################################### Cenario Triste #####################################
### Cenarios De Testes Relacionados Ao Login ###
Cenario: Tentar Cadastrar Produto Valido Nao Administrador
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Valido_Nao_Administrador
    ${produto} =    Pegar Produto Nao Cadastrado
    Logar E Salvar Token Como Administrador "false"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Mensagem "Rota exclusiva para administradores"
    Validar Status Code "403"

Cenario: Tentar Cadastar Produto Nao Autenticado
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Nao_Autenticado
    ${produto} =    Pegar Produto Nao Cadastrado
    POST EndPoint "/produtos" Com Body "${produto}"
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenario: Tentar Cadastrar Produto Com Token Invalido
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Com_Token_Invalido
    ${produto} =    Pegar Produto Nao Cadastrado
    POST EndPoint "/produtos" Com Body "${produto}" Com Token Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

##################################### Cenario Triste #####################################
### Cenarios de Testes Relacionados Ao Body ###
Cenario: Tentar Cadastrar Produto Ja Cadastrado
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Ja_Cadastrado
    ${produto} =    Pegar Produto Cadastrado
    Remove From Dictionary    ${produto}      _id
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Mensagem "Já existe produto com esse nome"
    Validar Status Code "400"

### Cenarios de Testes Relacionados A Key Nome ###
Cenario: Tentar Cadastar Produto Com Nome Vazio
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Com_Nome_Vazio
    ${produto} =    Pegar Produto Do JSON Sem O Campo "nome"
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "nome" Com O Valor "nome é obrigatório"

### Cenarios de Testes Relacionados A Key Preco ###
Cenario: Tentar Cadastar Produto Com Preco Vazio
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Com_Preco_Vazio
    ${produto} =    Pegar Produto Do JSON Sem O Campo "preco"
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "preco" Com O Valor "preco é obrigatório"

Cenario: Tentar Cadastar Produto Com Preco Invalido
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Preco_Invalido
    ${produto} =    Pegar Produto Do JSON Com o Campo "preco" Invalido
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "preco" Com O Valor "preco deve ser um inteiro"

### Cenarios de Testes Relacionados A Key Descricao ###
Cenario: Tentar Cadastar Produto Com Descricao Vazia
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Com_Descricao_Vazia
    ${produto} =    Pegar Produto Do JSON Sem O Campo "descricao"
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "descricao" Com O Valor "descricao é obrigatório"

### Cenarios de Testes Relacionados A Key Quantidade ###
Cenario: Tentar Cadastar Produto Com Quantidade Vazia
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Com_Quantidade_Vazia
    ${produto} =    Pegar Produto Do JSON Sem O Campo "quantidade"
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "quantidade" Com O Valor "quantidade é obrigatório"

Cenario: Tentar Cadastrar Produto Com A Quantidade Invalida
    [Tags]      POST        Cadastrar_Produto      Cadastar_Produto_Quantidade_Invalida
    ${produto} =    Pegar Produto Do JSON Com o Campo "quantidade" Invalido
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Status Code "400"
    Validar "quantidade" Com O Valor "quantidade deve ser um inteiro"
