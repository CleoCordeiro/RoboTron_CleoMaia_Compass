#Sessão para criação de keywords
*** Keywords ***
Quantidade De Carrinhos
   GET Endpoint "/carrinhos"
   [Return]             ${response_body['quantidade']}

Pegar Carrinho Cadastrado
   GET Endpoint "carrinhos"
   Set Test Variable         ${carrinho}      ${response_body['carrinhos'][-1]}
   [Return]                  ${carrinho}

Cadastrar Novo Carrinho
    ${carrinho} =      Gerar Carrinho Valido
    Logar E Salvar Token Como Administrador "true"
    Modificar Headers
    POST Autenticado EndPoint "/carrinhos" Com Body "${carrinho}" Headers "${headers}"
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Se A Key Nao Esta Vazia "_id"
    [Return]        ${response_body}

Gerar Carrinho Valido
    ${produtos} =  Lista De Todos Produtos
    Set Test Variable              ${lista_de_produtos}            ${produtos['produtos']}
    ${quantidade_de_produtos} =    Get length                      ${lista_de_produtos}
    ${quantidade_aleatoria}        FakerLibrary.Random Int         min=0   max=${quantidade_de_produtos-1}
    @{nova_lista_produtos}         Create List
    ${carrinho}=	               Create Dictionary
    FOR    ${i}  IN RANGE          ${quantidade_aleatoria}
        ${quantidade_de_produtos} =    Get length                     ${lista_de_produtos}
        ${index_produto}               FakerLibrary.Random Int        min=0   max=${quantidade_de_produtos-1}
        ${produto} =                   Remove From List               ${lista_de_produtos}    ${index_produto}
        IF                             ${produto['quantidade']} <= 0  CONTINUE
        ${quantidade}                  FakerLibrary.Random Int        min=1   max=3
        &{novo_produto}                Create Dictionary
        set to dictionary              ${novo_produto}                idProduto=${produto['_id']}
        set to dictionary              ${novo_produto}                quantidade=${quantidade}
        Append To List                 ${nova_lista_produtos}         ${novo_produto}
    END
    ${carrinho}=   Add Object To Json  ${carrinho}                    $.produtos   ${nova_lista_produtos}
    ${carrinho}=   Evaluate            json.dumps(${carrinho})        json
    [Return]   ${carrinho}

Gerar Carrinho Invalido Sem "${key}"
    ${produtos} =  Lista De Todos Produtos
    Set Test Variable              ${lista_de_produtos}            ${produtos['produtos']}
    ${quantidade_de_produtos} =    Get length                      ${lista_de_produtos}
    ${quantidade_aleatoria}        FakerLibrary.Random Int         min=0   max=${quantidade_de_produtos-1}
    @{nova_lista_produtos}         Create List
    ${carrinho}=	               Create Dictionary
    FOR    ${i}  IN RANGE          ${quantidade_aleatoria}
        ${quantidade_de_produtos} =    Get length                     ${lista_de_produtos}
        ${index_produto}               FakerLibrary.Random Int        min=0   max=${quantidade_de_produtos-1}
        ${produto} =                   Remove From List               ${lista_de_produtos}    ${index_produto}
        IF                             ${produto['quantidade']} <= 0  CONTINUE
        ${quantidade}                  FakerLibrary.Random Int        min=1   max=${produto['quantidade']}
        &{novo_produto}                Create Dictionary
        set to dictionary              ${novo_produto}                idProduto=${produto['_id']}
        set to dictionary              ${novo_produto}                quantidade=${quantidade}
        remove from dictionary         ${novo_produto}                ${key}
        Append To List                 ${nova_lista_produtos}         ${novo_produto}
    END
    ${carrinho}=   Add Object To Json  ${carrinho}                    $.produtos   ${nova_lista_produtos}
    ${carrinho}=   Evaluate            json.dumps(${carrinho})        json
    [Return]   ${carrinho}

Gerar Carrinho Produto Invalido
    @{nova_lista_produtos}             Create List
    &{carrinho}=	                   Create Dictionary
    &{novo_produto}                    Create Dictionary
    set to dictionary                  ${novo_produto}                idProduto=NaoExisto
    set to dictionary                  ${novo_produto}                quantidade=5
    Append To List                     ${nova_lista_produtos}         ${novo_produto}
    ${carrinho}=   Add Object To Json  ${carrinho}                    $.produtos   ${nova_lista_produtos}
    ${carrinho}=   Evaluate            json.dumps(${carrinho})        json
    [Return]   ${carrinho}

Gerar Carrinho Quantidade Insuficiente
    ${produtos} =  Lista De Todos Produtos
    @{nova_lista_produtos}             Create List
    &{carrinho}=	                   Create Dictionary
    &{novo_produto}                    Create Dictionary
    set to dictionary                  ${novo_produto}                idProduto=${produtos['produtos'][0]['_id']}
    set to dictionary                  ${novo_produto}                quantidade=99999
    Append To List                     ${nova_lista_produtos}         ${novo_produto}
    ${carrinho}=   Add Object To Json  ${carrinho}                    $.produtos   ${nova_lista_produtos}
    ${carrinho}=   Evaluate            json.dumps(${carrinho})        json
    [Return]   ${carrinho}
