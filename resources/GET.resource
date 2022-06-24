#Faz uma requisição GET no endpoint passado como parâmetro
*** Keywords ***
GET Endpoint "${endpoint}"
    ${response}          GET On Session      serverest             ${endpoint}    expected_status=any
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}    ${response.json()}