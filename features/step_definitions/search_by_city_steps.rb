# Checks the nav bar title to determine the page
Given /^I am on the "([^"]+)" Screen$/ do |label_text|
  check_element_exists("UINavigationItemView label marked:'#{label_text}'")
end

# Use the button label instead of accessibility
When /^I tap the "([^"]+)" button$/ do |btn_text|
  touch("button label marked:'#{btn_text}'")
end

# Selects an item from an open picker view
When /^I pick "([^"]+)" from the list$/ do |label_text|
  touch("view label marked:'#{label_text}'")
end

