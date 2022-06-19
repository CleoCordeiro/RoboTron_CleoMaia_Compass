#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Library           FakerLibrary


#Sessão para criação de keywords
*** Keywords ***
Gerar Dados Do Novo Usuario Administrador ${administrador}
    ${nome}      FakerLibrary.Name
    ${email}     FakerLibrary.Email
    ${senha}     FakerLibrary.Password
    &{usuario}   Create Dictionary  nome=${nome}    email=${email}  password=${senha}  administrador=${administrador}
    Set Test Variable  ${usuario}
