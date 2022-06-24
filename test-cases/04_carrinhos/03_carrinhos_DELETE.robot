#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation   Arquivo De Requisições Do Tipo DELETE DA API Do EndPoint Carrinhos
Resource        ../../resources/resource.resource
Test Setup      Criar Sessao

#Sessão para criação de cenários de teste
*** Test Cases ***
##################################### Cenario Concluir Compra #######################################
################ Cenario Feliz ################
Cenario: Concluir Compra Com Carrinho Valido
    [Tags]      DELETE     Carrinhos       DELETE_Carrinhos       Concluir_Compra     Concluir_Compra_Carrinho_Valido 
    Cadastrar Novo Carrinho
    DELETE Autenticado EndPoint "carrinhos/concluir-compra" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"

################ Cenario Triste ################
Cenario: Tentar Concluir Compra Usuario Sem Carrinho
    [Tags]      DELETE     Carrinhos       DELETE_Carrinhos       Concluir_Compra_Carrinho_Invalido
    Logar E Salvar Token Como Administrador "false"
    DELETE Autenticado EndPoint "carrinhos/concluir-compra" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Não foi encontrado carrinho para esse usuário"

Cenario: Tentar Concluir Compra Com Carrinho Valido Token Invalido
    [Tags]      DELETE     Carrinhos       DELETE_Carrinhos       Concluir_Compra     Concluir_Compra_Token_Invalido
    ${carrinho} =   Pegar Carrinho Cadastrado
    Logar E Salvar Token Usando ID Do Usuario "${carrinho['idUsuario']}"
    DELETE EndPoint "carrinhos/concluir-compra" Com Token Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"


##################################### Cancelar Compra #####################################
################ Cenario Feliz ################
Cenario: Cancelar Compra Com Carrinho Valido
    [Tags]      DELETE     Carrinhos       DELETE_Carrinhos       Cancelar_Compra     Cancelar_Compra_Carrinho_Valido
    Cadastrar Novo Carrinho
    DELETE Autenticado EndPoint "carrinhos/cancelar-compra" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso. Estoque dos produtos reabastecido"


################ Cenario Triste ################
Cenario: Tentar Cancelar Compra Usuario Sem Carrinho
    [Tags]      DELETE     Carrinhos       DELETE_Carrinhos       Cancelar_Compra     Cancelar_Compra_Carrinho_Invalido
    Logar E Salvar Token Como Administrador "false"
    DELETE Autenticado EndPoint "carrinhos/cancelar-compra" Headers "${headers}"
    Validar Status Code "200"
    Validar Mensagem "Não foi encontrado carrinho para esse usuário"

Cenario: Tentar Cancelar Compra Com Carrinho Valido Token Invalido
    [Tags]      DELETE     Carrinhos       DELETE_Carrinhos       Cancelar_Compra     Cancelar_Compra_Token_Invalido
    ${carrinho} =   Pegar Carrinho Cadastrado
    Logar E Salvar Token Usando ID Do Usuario "${carrinho['idUsuario']}"
    DELETE EndPoint "carrinhos/concluir-compra" Com Token Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"