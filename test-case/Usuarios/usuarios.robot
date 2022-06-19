#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Resource           ../../resources/resource.robot
Resource           payload.robot
Test Setup         Criar Sessao

#Sessão para configuração de variáveis
*** Variables ***
${id_usuario_invalido}         NaoExisto


#Sessão para criação de keywords
*** Keywords ***
Dado Que Eu Realize Uma Requisicao Do Tipo Get No Endpoint ${endpoint}
    GET Endpoint ${endpoint}

Entao Devo Receber O Status Code ${status_code} 
    Validar Status Code ${statuscode}

E A Resposta Deve Conter Uma Listagem De Usuarios Com Tamanho Maior Que ${quantidade}
    Validar Quantidade de Usuarios > ${quantidade}

E A Resposta Deve Conter O Usuario Com O ID Informado
    Should Be Equal         ${response_body['_id']}    ${id_usuario_valido}

E A Resposta Deve Conter A Mensagem ${mensagem}
    Validar Mensagem ${mensagem}

#Salva o ID do primeiro usuário da lista de usuários retornada pela requisição
Dado Que Eu Tenha Um Usuario Cadastrado
    GET Endpoint /usuarios
    Validar Quantidade de Usuarios > 0
    Set Suite Variable      ${id_usuario_valido}         ${response_body['usuarios'][0]['_id']}

E Realize Uma Busca Por Esse Usuario
    GET Endpoint usuarios/${id_usuario_valido}

Dado Que Eu Realize Uma Busca Por Um Usuario Que Nao Existe
    GET Endpoint /usuarios/${id_usuario_invalido}

Validar Quantidade De Usuarios ${operador} ${quantidade}
    Should Be True          ${response_body['quantidade']} ${operador} ${quantidade}

Dado Que Eu Crie Os Dados De Um Novo Usuario Administrador
    Gerar Dados Do Novo Usuario Administrador true

Dado Que Eu Crie Os Dados De Um Novo Usuario
    Gerar Dados Do Novo Usuario Administrador false

E Realize O Cadastro Do Usuario
    POST Endpoint /usuarios Com Body ${usuario}

#Sessão para criação de cenários de teste
*** Test Cases ***
#Teste de listagem de usuários
Cenario: GET Todos Os Usuarios 200
    Dado Que Eu Realize Uma Requisicao Do Tipo Get No Endpoint /usuarios
    Entao Devo Receber O Status Code 200
    E A Resposta Deve Conter Uma Listagem De Usuarios Com Tamanho Maior Que 0

#Teste de busca de usuário por id válido
Cenario: GET Usuario Por Id Valido
    Dado Que Eu Tenha Um Usuario Cadastrado
    E Realize Uma Busca Por Esse Usuario
    Entao Devo Receber O Status Code 200
    E A Resposta Deve Conter O Usuario Com O ID Informado

#Teste de busca de usuário por id inválido
Cenario: GET Usuario Por Id Invalido
    Dado Que Eu Realize Uma Busca Por Um Usuario Que Nao Existe
    Entao Devo Receber O Status Code 400
    E A Resposta Deve Conter A Mensagem Usuário não encontrado

#Teste de criação de usuário
Cenario: POST Criar Usuario Administrador Valido
    Dado Que Eu Crie Os Dados De Um Novo Usuario Administrador
    E Realize O Cadastro Do Usuario
    Entao Devo Receber O Status Code 201
    E A Resposta Deve Conter A Mensagem Cadastro realizado com sucesso
