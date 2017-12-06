*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/FlightsList_Page.txt
Resource          ../../Objects/Tours.txt
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
    Click Element    ${modifySearchButton}
    Wait Until Page Contains    Search
    Fill Search For Flight FlightsPage    ${flightOrigin}    ${flightDestination}
    Click Element    ${searchFlightButton}
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

1_search_tour_homepage
    Click Element    ${tourButtonHome}
    Wait Until Element Is Visible    ${searchButton}
    Click Element    ${searchButton}
    Click Element    ${detailsButton}
    
2_search_tour_menu
    StartTourSearch

3_tour_reservation_guest
    StartTourSearch
    BookTour
    Click Element    ${guestTab}
    Input Text    ${firstName}    ${name}
    Click Element    ${lastName}
    Input Text    ${lastName}    ${name2}
    Click Element    ${email}
    Input Text    ${email}    ${em}
    Click Element    ${confirmEmail}
    Input Text    ${confirmEmail}    ${em}
    Execute Javascript    window.scrollTo(480,1225)
    Click Element    ${contactNumber}
    Input Text    ${contactNumber}    ${tel}
    Click Element    ${address}
    Input Text    ${address}    ${userAddress}
    Click Element    ${selectCountry}
    Click Element    ${czechRepublic}
    FinishTourBooking

4_tour_reservation_user
    StartTourSearch
    BookTour
    Click Element    ${signInTab}
    Wait Until Element Is Visible    ${demoEmailField}
    Click Element    ${demoEmailField}
    Input Text    ${demoEmailField}    ${demoEmail}
    Click Element    ${passwordField}
    Input Password    ${passwordField}    ${demoPassword}
    Execute Javascript    window.scrollTo(480,1147)
    FinishTourBooking
