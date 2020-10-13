Given(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see a search bar$/) do
  has_field?("search form-control")
end

Then(/^I should see a list of queries$/) do
  has_table?("table")
end

Then(/^I should see a button to create a new query$/) do
  has_button?("btn btn-info dropdown-toggle")
end
