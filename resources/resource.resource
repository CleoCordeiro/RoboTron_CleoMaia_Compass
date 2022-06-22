#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation    Arquivo base para requisições HTTP em APIs Rest    
Library          RequestsLibrary


#Sessão para configuração de variáveis
*** Variables ***
${url}    https://serverest.dev

#Sessão para criação de keywords
*** Keywords ***
#Cria uma Sessão
Criar Sessao
    Create Session    serverest    ${url}    verify=true    

#Faz uma requisição GET no endpoint passado como parâmetro
GET Endpoint "${endpoint}"
    ${response}          GET On Session      serverest             ${endpoint}    expected_status=any
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}    ${response.json()}

POST Endpoint "${endpoint}" Com Body "${body}"
    ${response}          POST On Session     serverest             ${endpoint}    data=${body}    expected_status=any    
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}    ${response.json()}

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

