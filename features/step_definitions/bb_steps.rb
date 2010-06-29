Given /^a child$/ do
  @child = Factory.create(:child)
end

Given /^the following children$/ do |table|
  table.hashes.each do |hash|
    Factory.create(:child, hash)
  end
end

When /^I click the featured child banner$/ do
  Then 'I follow "sponsor_now" within "div.featured"'
end

Then /^debug$/ do
  debugger
end