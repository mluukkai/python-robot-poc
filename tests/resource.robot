*** Settings ***
Library  SeleniumLibrary
Library  ../AppLibrary.py

*** Variables ***
${SERVER}  localhost:5000
${DELAY}  0.5 seconds
${HOME_URL}  http://${SERVER}
${NEW_URL}  http://${SERVER}/new
#${BROWSER}  firefox
${BROWSER}  chrome

*** Keywords ***
Open And Configure Browser
    #${options}  Evaluate  sys.modules['selenium.webdriver'].FirefoxOptions()  sys
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    # seuraava rivi on kommentoitu toistaiseksi pois
    Call Method  ${options}  add_argument  --headless
    Open Browser  browser=${BROWSER}  options=${options}
    Set Selenium Speed  ${DELAY}
    Reset Application