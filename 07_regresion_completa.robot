*** Settings ***
Documentation    Suite de regresión completa combinando pruebas API y UI.

Library    RequestsLibrary
Library    SeleniumLibrary

Suite Setup       Preparar Ambiente
Suite Teardown    Finalizar Ambiente


*** Variables ***
${API_URL}    https://jsonplaceholder.typicode.com
${UI_URL}     https://www.google.com


*** Test Cases ***

Validar API de usuarios
    [Tags]    regresion
    Crear Sesion API
    ${respuesta}=    GET On Session    api    /users/1
    Should Be Equal As Integers    ${respuesta.status_code}    200


Validar API de publicaciones
    [Tags]    regresion
    Crear Sesion API
    ${respuesta}=    GET On Session    api    /posts/1
    Should Be Equal As Integers    ${respuesta.status_code}    200


Validar interfaz web
    [Tags]    regresion
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser    ${UI_URL}    Chrome    options=${options}
    Title Should Be    Google
    Close Browser


*** Keywords ***

Preparar Ambiente
    Log    Iniciando suite de regresión completa


Crear Sesion API
    Create Session    api    ${API_URL}


Finalizar Ambiente
    Log    Finalizando suite de regresión completa