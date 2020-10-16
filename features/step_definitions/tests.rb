Given(/^I am on "new query" page$/) do
  visit "/queries/new"
end

Given(/^I am on "new checks" page$/) do
  visit "/checks/new"
end

Given(/^I am on "new dashboards" page$/) do
  visit "/dashboards/new"
end

When(/^I fill out "new query" form and click "create"$/) do
  page.execute_script("document.querySelector('#query_statement').value='SELECT * FROM movies LIMIT 10'")
  fill_in "query_name", with: "Cucumber_Test_Query"
  fill_in "query_description", with: "A sample description"
  click_button("Create")
end

# TODO
When(/^I fill out "new check" form and click "save"$/) do
  find("selectize-control single").click()
  find("div", :text => /\Aoption\z/).click()
  # Choose Query

  # can't interact with dropdown bc elements are in script
  # unsure how to access
  #page.execute_script("document.querySelector('#check_query_id').value='10'")
  #select("Check for Bad Data", from: "selectize-dropdown single")
  click_button("DOES NOT EXIST")
end

#TODO
When(/^I fill out "new dashboard" form and click "save"$/) do
  page.execute_script("document.querySelector('#dashboard_name').value='sample dashboard'")
  # same issue as dropdown element in "new check"
  # can see its in slectize-control-single > selectize-dropdown-content
  # but nothing to get it with. Is there a way to select by the text?
  # e.g. <div class ...>SELECT THIS</div>
  click_button("Save")
end

Then(/^I should see results$/) do
  has_table?("table results-table")
end

Then(/^I should see the result of the dashboard$/) do
  expect(page).to have_css '.chart'
end
