*** Settings ***
Test Setup        Prepare Browser    ${url}    ${browser}
Test Teardown     Close Browser
Default Tags      Tours
Library           Selenium2Library
Resource          ../../Keywords/Common_Keywords.txt
Resource          ../../Objects/Main_Page.txt
Resource          ../../Objects/FlightsList_Page.txt
Resource          ../../Objects/Tours.txt
Resource          ../../Settings/Browser_Settings.txt

*** Test Cases ***
1_search_tour_homepage
    Click Element    ${tourButtonHome}
    Wait Until Element Is Visible    ${searchButton}
    Click Element    ${searchButton}
    Click Element    ${detailsButton}

2_search_tour_menu
    StartTourSearch


