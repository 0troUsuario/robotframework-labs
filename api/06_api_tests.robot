*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com


*** Test Cases ***
Obtener Lista De Usuarios

    Create Session
    ...    jsonplaceholder
    ...    ${BASE_URL}

    ${response}=    GET On Session
    ...    jsonplaceholder
    ...    url=/users

    Status Should Be    200    ${response}

    ${usuarios}=    Set Variable    ${response.json()}

    Should Be True    len(${usuarios}) > 0


Crear Nuevo Usuario

    Create Session
    ...    jsonplaceholder
    ...    ${BASE_URL}

    &{payload}=    Create Dictionary
    ...    name=Carlos
    ...    username=QA
    ...    email=carlos@test.com

    ${response}=    POST On Session
    ...    jsonplaceholder
    ...    url=/users
    ...    json=${payload}

    Status Should Be    201    ${response}

    Should Be Equal
    ...    ${response.json()}[name]
    ...    Carlos


Obtener Usuario Inexistente

    Create Session
    ...    jsonplaceholder
    ...    ${BASE_URL}

    ${response}=    GET On Session
    ...    jsonplaceholder
    ...    url=/users/9999
    ...    expected_status=404

    Status Should Be    404    ${response}