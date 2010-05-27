require File.join(Rails.root, 'spec', 'blueprints')

Given /^(.+) people exist with the last name "([^\"]*)"$/ do |count, last_name|
  number_of_people = count.match(/^\d+$/) ? count.to_i : 0

  25.times{ Person.make }

  Person.delete_all :last_name => last_name
  number_of_people.times do
    Person.make :last_name => last_name
  end
end

Given /^(.+) people exist with the name "([^\"]*)"$/ do |count, name|
  number_of_people = count.match(/^\d+$/) ? count.to_i : 0

  name_parts = name.split /\s+/

  25.times{ Person.make }

  Person.delete_all :first_name => name_parts.first, :last_name => name_parts.last
  number_of_people.times do
    Person.make :first_name => name_parts.first, :last_name => name_parts.last
  end
end

Then /^I should see (\d+) person divs with "([^\"]*)"$/ do |num, name|
  response.should have_selector('div.person', :count => num) do |matched|
    matched.should have_selector('h3.name') do |person_name|
      person_name.should contain(name)
    end
    matched.should have_selector('div.addr')
    matched.should have_selector('div.assist')
    matched.should have_selector('div.tools') do |tool_links|
      tool_links.should have_selector('a.case-list')
      tool_links.should have_selector('a.case-create')
      tool_links.should have_selector('a.person-show')
    end
  end
end
