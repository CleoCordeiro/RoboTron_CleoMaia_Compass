*** Settings ***
Documentation    Arquivo base para requisições HTTP em APIs Rest


#Sessão para criação de keywords
*** Keywords ***
Quantidade De Produtos
   GET Endpoint "/produtos"
   [Return]             ${response_body['quantidade']}

Pegar Produto Ja Cadastrado
   GET Endpoint "/produtos"
   Set Test Variable         ${produto}      ${response_body['produtos'][0]}
   Remove From Dictionary    ${produto}      _id 
   [Return]                  ${produto}

Pegar Produto Do JSON
    ${quantidade} =     Quantidade De Produtos
    ${produtos} =       Importar JSON  produtos.json
    [Return]            ${produtos['produtos'][${quantidade}]}

Pegar Produto Do JSON Sem O Campo "${parametro}"
    ${produto} =                     Pegar Produto Do JSON
    Remove From Dictionary           ${produto}                ${parametro}
    [Return]                         ${produto}

Pegar Produto Do JSON Preco Invalido
    ${produto} =        Pegar Produto Do JSON
    ${new_produto} =	   Update Value To Json    ${produto}     preco    1.5
    [Return]            ${new_produto}

Pegar Produto Do JSON Com o Campo ${key} Invalido
    ${produto} =        Pegar Produto Do JSON
    ${new_produto} =	   Update Value To Json    ${produto}     ${key}    1.5
    [Return]            ${new_produto}