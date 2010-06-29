Given /^a child$/ do
  @child = Factory.create(:child)
end
 
Given /^the following children$/ do |table|
  table.map_column!('birthday') do |birthday| 
    if birthday =~ /(\d)_YEARS_AGO/
      birthday = $1.to_i.years.ago.strftime("%Y-%m-%d")
    end
    birthday
  end
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