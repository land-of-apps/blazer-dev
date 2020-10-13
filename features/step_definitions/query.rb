# Query Tests
# - run query
# - create query
# - edit query
# - delete query

Given(/^I am on "new query" page$/) do
  visit "/queries/new"
end

When(/^I navigate to a query$/) do
  visit "/queries/14-images"
end

When(/^I enter a query into the search bar$/) do
  find(".form-control").set("URLs")
end

When(/^I fill out "new query" form and click "create"$/) do

  #find_field(id: 'query_statement', type: :hidden).set('testing1')
  first("input#query_statement", visible: false).set("testing2")

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

Then(/^I should see results$/) do
  has_table?("table results-table")
end

Then(/^I should see that query$/) do
  expect(page).to have_text("URLs")
end
