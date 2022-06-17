#Sessão para configuração, documentação, importação de aquivos e librarys
* Settings *
Resource           ../resources/resource.robot


#Sessão para configuração de variáveis
* Variables *
${valid_id}           BsOyYgiFHtxtmqpn
${invalid_id}         NaoExisto


#Sessão para criação de cenários de teste
* Test Cases *
#Teste de listagem de usuários
Cenario: GET Todos os Usuarios 200
    Criar Sessao
    GET Endpoint "/usuarios"
    Validar Status Code "200"

#Teste de busca de usuário por id válido
Cenario: GET Usuario por Id Valido
    Criar Sessao
    GET Endpoint "/usuarios/${valid_id}"
    Validar Status Code "200"
    #Validar Response "Usuário não encontrado"

#Teste de busca de usuário por id inválido
Cenario: GET Usuario por Id Invalido
    Criar Sessao
    GET Endpoint "/usuarios/${invalid_id}"
    Validar Status Code "400"
    #Validar Response "Usuário não encontrado"


