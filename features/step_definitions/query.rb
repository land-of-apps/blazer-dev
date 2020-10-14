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
  page.execute_script("document.querySelector('#query_statement').value='SELECT * FROM movies LIMIT 10'")
  fill_in "query_name", with: "Cucumber_Test_Query"
  fill_in "query_description", with: "A sample description"
  click_button("Create")
end

Then(/^I should see the results of the query$/) do
  page.all("table results-table#table tr").count.should == 10
end

Then(/^I should see results$/) do
  has_table?("table results-table")
end

Then(/^I should see that query$/) do
  expect(page).to have_text("URLs")
end
