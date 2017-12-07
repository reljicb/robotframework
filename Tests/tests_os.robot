
*** Settings ***

Library  OperatingSystem

*** Keywords ***


*** Test Cases ***

Test Run Process
    Log To Console  \n

    ${cmd}=  Set Variable  java -jar ../bin/selenium-server.jar

    Log To Console  cmd: ${cmd}

    ${out}=  Run  ${cmd}
    Log To Console  out: ${out}
