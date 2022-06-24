#Faz uma requisição DELETE no endpoint passado como parâmetro
*** Keywords ***
DELETE Endpoint "${endpoint}"
    ${response}          DELETE On Session    serverest             ${endpoint}    expected_status=any    
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}     ${response.json()}

DELETE Autenticado EndPoint "${endpoint}" Headers "${headers}"
    ${response}          DELETE On Session       serverest       ${endpoint}       expected_status=any       headers=${headers}
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}      ${response.json()}

DELETE EndPoint "${endpoint}" Com Token Invalido
    &{header}=           Create Dictionary      Authorization=Token Invalido
    ${response}          DELETE On Session      serverest      ${endpoint}      expected_status=any       headers=${header}
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}       ${response.json()}
