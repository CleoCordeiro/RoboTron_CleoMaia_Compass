#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Resource           ../resources/resource.robot
Test Setup         Criar Sessao

#Sessão para configuração de variáveis
*** Variables ***
${usuario_invalido}         NaoExisto

#Sessão para criação de keywords
*** Keywords ***
Dado Que Eu Realize Uma Requisicao Do Tipo Get No Endpoint ${endpoint}
    GET Endpoint ${endpoint}

Então O Status Code Deve Ser Igual A ${status_code} 
    Validar Status Code ${statuscode}

E A Resposta Deve Conter Uma Listagem De Usuarios Com Tamanho Maior Que ${quantidade}
    Validar Quantidade de Usuarios > ${quantidade}
    Salvar ID Usuario Valido

E A Resposta Deve Conter O Usuario Com O ID Igual A ${id}
    Validar Usuario ${id}

E A Resposta Deve Conter A Mensagem ${mensagem}
    Validar Mensagem ${mensagem}

#Salva o ID do primeiro usuário da lista de usuários retornada pela requisição
Salvar ID Usuario Valido
    Set Suite Variable      ${usuario_valido}         ${response_body['usuarios'][0]['_id']}

Validar Quantidade De Usuarios ${operador} ${quantidade}
    Should Be True          ${response_body['quantidade']} ${operador} ${quantidade}

Validar Usuario ${id_usuario}
    Should Be Equal         ${response_body['_id']}    ${id_usuario}


#Sessão para criação de cenários de teste
*** Test Cases ***
#Teste de listagem de usuários
Cenario: GET Todos os Usuarios 200
    Dado Que Eu Realize Uma Requisicao Do Tipo Get No Endpoint /usuarios
    Então O Status Code Deve Ser Igual A 200
    E A Resposta Deve Conter Uma Listagem De Usuarios Com Tamanho Maior Que 0


#Teste de busca de usuário por id válido
Cenario: GET Usuario por Id Valido
    Dado Que Eu Realize Uma Requisicao Do Tipo Get No Endpoint /usuarios/${usuario_valido}
    Então O Status Code Deve Ser Igual A 200
    E A Resposta Deve Conter O Usuario Com O ID Igual A ${usuario_valido}


#Teste de busca de usuário por id inválido
Cenario: GET Usuario por Id Invalido
    Dado Que Eu Realize Uma Requisicao Do Tipo Get No Endpoint /usuarios/${usuario_invalido}
    Então O Status Code Deve Ser Igual A 400
    E A Resposta Deve Conter A Mensagem Usuário não encontrado

