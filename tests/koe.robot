*** Settings ***
Resource  resource.robot
Suite Setup  Open And Configure Browser
Suite Teardown  Close Browser

*** Test Cases ***
Result is one
    Go To  ${ONE_URL}
    Page Should Contain  result 1

Result is not two
    Go To  ${ONE_URL}
    Page Should Contain  result 2
