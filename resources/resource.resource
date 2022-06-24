#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation    Arquivo base para requisições HTTP em APIs Rest
Resource        ../test-cases/01_login/login_keywords.robot
Resource        ../test-cases/02_usuarios/usuarios_keywords.robot
Resource        ../test-cases/03_produtos/produtos_keywords.robot
Resource        ../test-cases/04_carrinhos/carrinhos_keywords.robot
Resource        GET.resource
Resource        POST.resource
Resource        PUT.resource
Resource        DELETE.resource
Library         Collections
Library         FakerLibrary
Library         String   
Library         RequestsLibrary
Library         OperatingSystem
Library         JSONLibrary


#Sessão para configuração de variáveis
*** Variables ***
${url}    http://localhost:3000/

#Sessão para criação de keywords
*** Keywords ***
#Cria uma Sessão
Criar Sessao
    Create Session    serverest    ${url}    verify=true    

#Faz a importação de um arquivo .json e retorna um JSON Dict'
Importar JSON
    [Arguments]        ${nome_arquivo} 
    ${arquivio}        GET File                ${EXECDIR}/resources/${nome_arquivo}
    ${data}            Evaluate                json.loads(r'''${arquivio}''')          json
    [Return]           ${data}

#Verifica se a resposta da requisição é igual ao valor passado como parâmetro
Validar Status Code "${statuscode}"
    Should Be True    ${response.status_code} == ${statuscode}

#Verifica se a resposta da requisição é igual ao valor passado como parâmetro
Validar Mensagem "${mensagem}"
    Should Be Equal    ${response_body['message']}    ${mensagem}

Validar Quantidade De ${item} ${operador} ${quantidade}
    Should Be True     ${response_body['quantidade']} ${operador} ${quantidade}

Validar Se A Key Nao Esta Vazia "${key}"
    Should Not Be Empty    ${response_body["${key}"]}

Modificar Headers
    Set to Dictionary    ${headers}     Content-Type=application/json 
