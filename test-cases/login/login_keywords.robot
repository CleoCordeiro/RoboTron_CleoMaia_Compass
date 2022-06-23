#Sessão para criação de keywords
*** Keywords ***
Logar E Salvar Token Como Administrador "${administrador}"
    ${usuario_valido} =     GET Usuario Valido Administrador "${administrador}"
    Remove From Dictionary           ${usuario_valido}        nome  administrador   _id
    POST Endpoint "/login" Com Body "${usuario_valido}"
    Validar Status Code "200"
    Validar Mensagem "Login realizado com sucesso"
    Validar Token
    &{headers}    Create Dictionary   Authorization=${response_body["authorization"]}
    Set Test Variable   ${headers}

Validar Token
    Should Not Be Empty     ${response_body["authorization"]}
