# Check Tests
# - create new check
# - edit existing check
# - run existing check
# - delete check
# - navigate to "edit check" page

Given(/^I am on "checks" page$/) do
  visit "/checks"
end

Given(/^I am on "new checks" page$/) do
  visit "/checks/new"
end

# TODO - which check to edit - use 4 as placeholder
Given(/^I am on "edit checks" page$/) do
  visit "/checks/4/edit"
end

When(/^I click "run now" button$/) do
  find(:xpath, "//a[@href='/queries/13-urls']", match: :first).click
end

# TODO
When(/^I click "edit" button$/) do
  find(:xpath, "//a[@href='/queries/13/edit']", match: first).click
end

# TODO
When(/^I click "new check" button$/) do
end

# TODO
When(/^I click "delete" button$/) do
end

# TODO
When(/^I fill out "new check" form and click "save"$/) do
  # Same issue as create new query
  # annoying js generated items make it difficult to capture

  # select URL query
  # set alert
  # set run time
  # click save
end

# TODO - same layout as "new check" but different url
When(/^I fill out "edit check" form and click "save"$/) do
end

# TODO - make sure check passes or just that it shows query??
Then(/^I should see the result of the check$/) do
  expect(page).to have_text("PASSING")
end

# TODO - this will be quick
Then(/^I should see the "edit check" form$/) do
end
