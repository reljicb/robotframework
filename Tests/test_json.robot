
*** Settings ***

Library   Collections
Library   requests
Library   jsondiff


*** Keywords ***
Load JSON from string
    [Arguments]   ${json_string}

    ${json}=  evaluate    json.loads('''${json_string}''')    json

    [Return]  ${json}


JSONs should be equal
    [Arguments]   ${json1}   ${json2}

    ${empty_dict}=  evaluate  json.loads('''{}''')   json

    ${diff}=  diff  ${json1}  ${json2}

    Should Be Equal  ${diff}  ${empty_dict}

JSONs should not be equal
    [Arguments]   ${json1}   ${json2}

    ${empty_dict}=  evaluate  json.loads('''{}''')   json

    ${diff}=  diff  ${json1}  ${json2}

    Should Not Be Equal  ${diff}  ${empty_dict}


*** Test Cases ***

Test JSON compare
    Log To Console  \n

    ${json1_string} =  Set Variable  { "a": "1", "b": "2", "array": [1, 2, 3], "obj": { "a": "1", "b": "2" } }
    ${json1} =  Load JSON from string  ${json1_string}
    Log To Console   json1: ${json1}

    ${json2_string} =  Set Variable  { "b": "2", "a": "1", "array": [1,2,3], "obj": { "b": "2", "a": "1" }}
    ${json2} =  Load JSON from string  ${json2_string}
    Log To Console   json2: ${json2}

    JSONs should be equal  ${json1}  ${json2}

    ${json3_string} =  Set Variable  { "b": "2", "a": "1", "array": [1, 3, 2], "obj": { "b": "2", "a": "1" }}
    ${json3} =  Load JSON from string  ${json3_string}
    Log To Console   json3: ${json3}

    JSONs should not be equal  ${json1}  ${json3}


