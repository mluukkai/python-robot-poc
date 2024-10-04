*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
Home Page Should Be Open
    Go To  ${HOME_URL}
    Title Should Be  Etusivu
    Page Should Contain  Viestien määrä: 0

Created note is shown
    Go To  ${NEW_URL}
    Input Text  content  hello robot
    Click Button  Lähetä
    Go To  ${HOME_URL}
    Page Should Contain  hello robot
    Page Should Contain  Viestien määrä: 1