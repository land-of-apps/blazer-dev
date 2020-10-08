Given(/^I am on the homepage$/) do
    visit "https://google.com"
    page.current_url
end

When(/^I click on "New Query"$/) do
    click_on(class: "btn btn-info dropdown-toggle")
end

Then(/^I should see be taken to an html form to create the query$/) do
    expect(page).to have_field("query[statement]")
end
