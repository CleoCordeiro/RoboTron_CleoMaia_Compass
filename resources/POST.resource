#Faz uma requisição POST no endpoint passado como parâmetro
*** Keywords ***
POST Endpoint "${endpoint}" Com Body "${body}"
    Run keyword if       '_id' in ${body}       Remove From Dictionary         ${body}        _id
    ${response}          POST On Session     serverest             ${endpoint}    data=${body}       expected_status=any
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}    ${response.json()}

POST Autenticado EndPoint "${endpoint}" Com Body "${body}" Headers "${headers}"
    Run keyword if       '_id' in ${body}      Remove From Dictionary         ${body}         _id
    ${response}          POST On Session       serverest       ${endpoint}    data=${body}    expected_status=any       headers=${headers}
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}      ${response.json()}

POST EndPoint "${endpoint}" Com Body "${body}" Com Token Invalido
    Run keyword if       '_id' in ${body}       Remove From Dictionary         ${body}        _id
    &{header}=           Create Dictionary      Authorization=Token Invalido
    ${response}          POST On Session        serverest       ${endpoint}    data=${body}    expected_status=any       headers=${header}
    Set Test Variable    ${response}
    Set Test Variable    ${response_body}       ${response.json()}