Feature: Searching for weather for a city
  As a user
  I want to search by city and state
  So that I can see what the current weather is there

Scenario: Searching for a valid city and state
  Given I am on the "Location Search" Screen
  When I use the native keyboard to enter "Detroit" into the "Enter City" input field
  And I touch the "Select State" input field
  And I pick "Michigan" from the list
  And I tap the "Find Weather" button
  Then I wait to see a navigation bar titled "Weather"
  And I should see "Detroit, MI"
  And I should see "Temperature:"
  And I should see "Conditions:"
  And I should see text containing "C)"
