*** Settings ***
Documentation  Arquivo Que Contem As Keywords Do EndPoint produtos


#Sessão para criação de keywords
*** Keywords ***
Cadastar Novo Produto
    ${produto} =    Pegar Produto Nao Cadastrado
    Logar E Salvar Token Como Administrador "true"
    POST Autenticado EndPoint "/produtos" Com Body "${produto}" Headers "${headers}"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Status Code "201"
    Validar Se A Key Nao Esta Vazia "_id"

Lista De Todos Produtos
    GET Endpoint "/produtos"
    [Return]             ${response_body}

Quantidade De Produtos
   GET Endpoint "/produtos"
   [Return]             ${response_body['quantidade']}

Pegar Produto Cadastrado
   GET Endpoint "/produtos"
   Set Test Variable         ${produto}      ${response_body['produtos'][-1]}
   [Return]                  ${produto}

Pegar Produto Nao Cadastrado
    ${lista_de_produtos} =     Lista De Todos Produtos
    ${produtos} =       Importar JSON  produtos.json
    ${quantidade_de_itens} =   Get Length       ${produtos['produtos']}
    FOR    ${i}    IN RANGE    ${quantidade_de_itens}
        IF  """${produtos['produtos'][${i}]['nome']}""" not in """${lista_de_produtos['produtos']}"""
            Set Test Variable         ${produto}      ${produtos['produtos'][${i}]}
            BREAK
        END
    END
    [Return]         ${produto}

Pegar Produto Do JSON Sem O Campo "${parametro}"
    ${produto} =                     Pegar Produto Cadastrado
    Remove From Dictionary           ${produto}                ${parametro}
    [Return]                         ${produto}

Pegar Produto Do JSON Com o Campo "${key}" Invalido
    ${produto} =        Pegar Produto Cadastrado
    set to dictionary                ${produto}                ${key}=1.5
    [Return]            ${produto}

Alterar "${tipo}" Campo "${key}" Do Produto
    ${produto} =        Pegar Produto Cadastrado
    IF                  "${tipo}" == "String"
        ${novo_valor}   FakerLibrary.Word
    ELSE IF             "${tipo}" == "Integer"
        ${novo_valor}    FakerLibrary.Random Int    min=1
    END
    set to dictionary                ${produto}                ${key}=${novo_valor}
    [Return]            ${produto}
