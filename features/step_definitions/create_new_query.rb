# TODO

Given(/^I am on new queries page$/) do
  visit "/queries/new"
end

When(/^I fill out the form and click create$/) do

  # select a table from dropdown menu to autofill query
  # unable to access hidden element with capybara
  select "genres", :from => "selectize-dropdown-content"

  select "option_name_here", :from => "organizationSelect"

  fill_in "query_name", with: "Cucumber_Test_Query"
  fill_in "query_description", with: "A sample description"
  click_button("Create")
end

Then(/^I should see the results of the new query$/) do
  page.all("table results-table#table tr").count.should == 10
end
