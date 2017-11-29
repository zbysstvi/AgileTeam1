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
    Open Flights List Page
    Click Button    ${bookFlightNowButton}
    Page Should Contain    Booking Options
    Wait Until Element Is Visible    ${loginAsUserGuestButton}
    Click Element    ${loginAsUserGuestButton}
    Wait Until Page Contains    Booking Summary    100
    Page Should Contain    Travellers Info
    Page Should Contain    Payment Information
    Page Should Contain Button    ${confirmBookingButton}
    Click Element    ${confirmBookingButton}
    Title Should Be    Flights List
    Input Text    ${enterEmailTextField}    ${demoLogin}
    Click Element    ${confirmBookingButton}
    Wait Until Page Contains    Your Booking is Confirmed    100

2_flight_rezervation
    Open Flights List Page
    Click Button    //*[@id="body-section"]/div[2]/div/div/div[4]/div/a/i
    Wait Until Page Contains    Search
