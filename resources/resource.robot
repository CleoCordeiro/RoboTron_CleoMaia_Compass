#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation           Arquivo base para requisições HTTP em APIs Rest   
Library    RequestsLibrary


#Sessão para configuração de variáveis
*** Variables ***
${url}                  https://serverest.dev

#Sessão para criação de keywords
*** Keywords ***
#Cria uma Sessão
Criar Sessao
    Create Session          serverest       ${url}      verify=true   

#Faz uma requisição GET no endpoint passado como parâmetro
GET Endpoint ${endpoint}
    ${response}             GET On Session       serverest              ${endpoint}    expected_status=any
    Set Global Variable     ${response}
    Set Global Variable     ${response_body}     ${response.json()}


#Verifica se a resposta da requisição é igual ao valor passado como parâmetro
Validar Status Code ${statuscode}
   Should Be True          ${response.status_code} == ${statuscode}

#Verifica se a resposta da requisição contém a mensagem esperada
Validar Mensagem ${esperado}
    Should Be Equal        ${response_body['message']}   ${esperado}

