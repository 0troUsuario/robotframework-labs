*** Settings ***
Documentation    Reto de cierre - Calculadora básica

*** Variables ***
${NUM1}    20
${NUM2}    5

*** Test Cases ***
Calculadora Basica
    ${suma}=              Evaluate    ${NUM1} + ${NUM2}
    ${resta}=             Evaluate    ${NUM1} - ${NUM2}
    ${multiplicacion}=    Evaluate    ${NUM1} * ${NUM2}
    ${division}=          Evaluate    ${NUM1} / ${NUM2}

    Log To Console    Suma: ${suma}
    Log To Console    Resta: ${resta}
    Log To Console    Multiplicación: ${multiplicacion}
    Log To Console    División: ${division}

    Should Be Equal As Numbers    ${multiplicacion}    100