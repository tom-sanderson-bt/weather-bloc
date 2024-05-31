Feature: Weather features

    Scenario: Shows pick a city on app load
        Given the app is running
        Then I see {"Select a city"} text

    Scenario: Searching for a city displays weather for the city
        Given the app is running 
        When I tap {Icons.search} icon
        And I wait
        And I enter {"London"} into {0} input field
        And I tap {"How's the weather?"} text
        And I wait
        Then I see {"London"} text
        And I see {"13.22°C"} text
        And I see {"Overcast clouds"} text
