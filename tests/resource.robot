*** Settings ***
Library  SeleniumLibrary
Library  ../AppLibrary.py

*** Variables ***
${SERVER}  localhost:5000
${DELAY}  0.5 seconds
${HOME_URL}  http://${SERVER}
${NEW_URL}  http://${SERVER}/new
${ONE_URL}  http://${SERVER}/one
${BROWSER}  chrome
# ${BROWSER}  firefox
# robot --variable BROWSER:firefox tests 

*** Keywords ***
Open And Configure Browser
    IF         $BROWSER == 'chrome'
        ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    ELSE IF    $BROWSER == 'firefox'
        ${options}  Evaluate  sys.modules['selenium.webdriver'].FirefoxOptions()  sys
    END
    # seuraava rivi on kommentoitu toistaiseksi pois
    Call Method  ${options}  add_argument  --headless
    Open Browser  browser=${BROWSER}  options=${options}
    Set Selenium Speed  ${DELAY}
    Setup Database
    Reset Application