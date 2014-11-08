Given(/^I am on the home page$/) do
  visit "/"
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content text
end