require File.join(Rails.root, 'spec', 'blueprints')

Given /^(.+) agencies exist with the name "([^\"]*)"$/ do |count, name|
  agency_count = count.match(/^\d+$/) ? count.to_i : 0

  Agency.delete_all :name => name

  agency_count.times do
    Agency.make :name => name
  end
end

