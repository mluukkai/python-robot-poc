*** Settings ***
Library  SeleniumLibrary
Library  ../AppLibrary.py

*** Variables ***
${SERVER}  localhost:5000
${DELAY}  0.5 seconds
${HOME_URL}  http://${SERVER}
${NEW_URL}  http://${SERVER}/new

*** Keywords ***
Open And Configure Browser
    ${options}  Evaluate  sys.modules['selenium.webdriver'].FirefoxOptions()  sys
    Call Method    ${options}    add_argument    --no-sandbox
    # seuraava rivi on kommentoitu toistaiseksi pois
    # Call Method  ${options}  add_argument  --headless
    Open Browser  browser=firefox  options=${options}
    Set Selenium Speed  ${DELAY}
    Reset Application