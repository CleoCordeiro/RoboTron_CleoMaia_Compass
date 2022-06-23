#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation    Arquivo base para requisições HTTP em APIs Rest
Resource        ../test-cases/usuarios/usuarios_keywords.robot
Resource        ../test-cases/login/login_keywords.robot
Resource        ../test-cases/produtos/produtos_keywords.robot
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

#Faz uma requisição GET no endpoint passado como parâmetro
GET Endpoint "${endpoint}"
    ${response}          GET On Session      serverest             ${endpoint}    expected_status=any
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}    ${response.json()}

POST Endpoint "${endpoint}" Com Body "${body}"
    ${response}          POST On Session     serverest             ${endpoint}    data=${body}    expected_status=any
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}    ${response.json()}

POST Autenticado EndPoint "${endpoint}" Com Body "${body}" Headers "${headers}" 
    ${response}          POST On Session       serverest       ${endpoint}    data=${body}    expected_status=any       headers=${headers}
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}      ${response.json()}

POST EndPoint "${endpoint}" Com Body "${body}" Com Token Invalido
    &{header}=           Create Dictionary      Authorization=Token Invalido

    ${response}          POST On Session        serverest       ${endpoint}    data=${body}    expected_status=any       headers=${header}
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}       ${response.json()}

PUT Endpoint "${endpoint}" Com Body "${body}"
    Run keyword if            '_id' in ${body}    Remove From Dictionary       ${body}        _id
    ${response}               PUT On Session      serverest                    ${endpoint}    data=${body}    expected_status=any    
    Set Test Variable         ${response}
    Set Test Variable         ${response_body}    ${response.json()}

DELETE Endpoint "${endpoint}"
    ${response}          DELETE On Session    serverest             ${endpoint}    expected_status=any    
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}     ${response.json()}

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
