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
    Click Element    ${modifySearchButton}
    Wait Until Page Contains    Search
    Click Element    //*[@id="s2id_autogen1"]
    Input Text    //*[@id="select2-drop"]/div/input    PRG
    Wait Until Element Is Visible    //*[@id="select2-drop"]/ul/li/div
    Click Element    //*[@id="select2-drop"]/ul/li/div
    Click Element    //*[@id="s2id_autogen3"]
    Input Text    //*[@id="select2-drop"]/div/input    MUC
    Wait Until Element Is Visible    //*[@id="select2-drop"]/ul/li/div
    Click Element    //*[@id="select2-drop"]/ul/li/div
    Click Element    //*[@id="modify"]/div[1]/div/form/div[3]/div[4]/button
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
