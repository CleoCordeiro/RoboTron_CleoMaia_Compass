#Sessão para configuração, documentação, importação de aquivos e librarys
* Settings *
Resource           ../resources/resource.robot


#Sessão para configuração de variáveis
* Variables *
${invalid_id}         NaoExisto


#Sessão para criação de cenários de teste
* Test Cases *
#Teste de listagem de usuários
Cenario: GET Todos os Usuarios 200
    Criar Sessao
    GET Endpoint "/usuarios"
    Validar Status Code "200"
    Should Be True          ${response_body['quantidade']} > 0
    Set Suite Variable      ${valid_id}                             ${response_body['usuarios'][0]['_id']}

#Teste de busca de usuário por id válido
Cenario: GET Usuario por Id Valido
    Criar Sessao
    GET Endpoint "/usuarios/${valid_id}"
    Log To Console          ${valid_id}
    Validar Status Code "200"
    Should Be Equal          ${response_body['_id']}                ${valid_id}

#Teste de busca de usuário por id inválido
Cenario: GET Usuario por Id Invalido
    Criar Sessao
    GET Endpoint "/usuarios/${invalid_id}"
    Validar Status Code "400"
    Should Be Equal           ${response_body['message']}           Usuário não encontrado


