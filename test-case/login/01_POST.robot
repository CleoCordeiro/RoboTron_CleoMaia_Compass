#Sessão para configuração, documentação, importação de aquivos e librarys
*** Settings ***
Documentation  Arquivo De Requisições Do Tipo POST DA API Do EndPoint Login
Resource    ../../resources/resource.resource

#Sessão para criação de cenários de teste
*** Test Cases ***
Cenario: Realizar Login Com Sucesso Administrador
    Dado Que Eu Realizar Um Login Como Administrador
    Entao Devo Receber O Status Code 200
    E A Mensagem Login Realizado Com Sucesso
    E O Token De Autenticação

Cenario: Realizar Login Com Sucesso Usuario
    Dado Que Eu Realizar Um Login Como Usuario
    Entao Devo Receber O Status Code 200
    E A Mensagem Login Realizado Com Sucesso
    E O Token De Autenticação

Cenario: Tentativa De Login Com Usuario Invalido
    Dado Que Eu Realizar Um Login Com Usuario Invalido
    Entao Devo Receber O Status Code 401
    E A Mensagem Email e/ou senha inválidos

