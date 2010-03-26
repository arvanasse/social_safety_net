require File.join(Rails.root, 'spec', 'blueprints')

Given /^(.+) people exist with the last name "([^\"]*)"$/ do |count, last_name|
  number_of_people = count.match(/^\d+$/) ? count.to_i : 0

  number_of_people.times do
    Person.make :last_name => last_name
  end
end

Given /^(.+) people exist with the name "([^\"]*)"$/ do |count, name|
  number_of_people = count.match(/^\d+$/) ? count.to_i : 0

  name_parts = name.split /\s+/

  number_of_people.times do
    Person.make :first_name => name_parts.first, :last_name => name_parts.last
  end
end
