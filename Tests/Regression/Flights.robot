*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/FlightsList_Page.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_flight_rezervation
    Click Link    http://www.phptravels.net/flight
    Title Should Be    Flights List
    Click Button    ${openFlightsPageButton}
    Page Should Contain    Booking Options
    Wait Until Element Is Visible    id=userGuest
    Click Element    ${loginAsUserGuestButton}
    Wait Until Page Contains    Booking Summary    100
    Page Should Contain    Travellers Info
    Page Should Contain    Payment Information
    Page Should Contain Button    id=confirmBooking
    Click Element    id=confirmBooking
    Title Should Be    Flights List
    Input Text    id=email    ${demoPassword}
    Click Element    id=confirmBooking
    Wait Until Page Contains    Your Booking is Confirmed    100
