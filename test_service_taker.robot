*** Settings ***
Library    Selenium2Library

*** Variables ***
${SITE_URL}   https://vaccine-haven.herokuapp.com/
${BROWSER}    Chrome
${CITIZEN_ID}  9621054552190
${SITE_NAME}  OGYHSite
${SELECTED_VACCINE}  Moderna

*** Keywords ***
# user defined expressions and actions

Open the Website
  Open Browser  ${SITE_URL}  ${BROWSER}
  Maximize Browser Window
  Page Should Contain 	 text=Vaccine Haven
  Page Should Contain 	 text=Vaccine for everyone

Select My Info on Home Page
  Element should be visible    link:My Info
  Page Should Contain Element  xpath=//a[@class="white"]

Select Walk In on Home Page
  Element should be visible    link:Walk-in
  Page Should Contain Element  xpath=//a[@class="white"]

Select Register Menu
  Click Element  xpath://text
  Click link  link:Reservation

Make Reservation
  Input Text  name=citizen_id  ${CITIZEN_ID}
  Click Element  xpath=//select[@name="site_name"]
  Click Element  xpath=//option[@value="OGYHSite"]
  Click Element  xpath=//select[@name="vaccine_name"]
  Click Element  xpath=//option[@value="Moderna"]
  Click Button   xpath://button[@type='submit']

Check Information
  Click link  link=My Info
  Input Text  name=citizen_id  ${CITIZEN_ID}
  Click Button   xpath://button[@type='submit']
  Page Should Contain  Panitan
  Page Should Contain  Plengkham
  Page Should Contain  ${SELECTED_VACCINE}

Cancel The Queue
  Click Button  id=cancel__btn

Go To Home Page
  Click Element  id=nav__home__link

*** Test Cases ***
Test 1 Website is available
  Open the Website

Test 2 Check if info button on Home Page functional
  Select My Info on Home Page

Test 3 Check if walk-in button on Home Page functional
  Select Walk In on Home Page

Test 4 Check if resevation menu on Home Page functional
  Select Register Menu

Test 5 Try to make a reservation
  Make Reservation
  Go To Home Page

Test 6 Check if citizen reservation functional
  Check Information

Test 7 Check if cancel the queue button functional
  Cancel The Queue
