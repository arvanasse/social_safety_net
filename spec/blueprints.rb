require 'machinist/active_record'
require 'sham'

Account.blueprint do
  name{ 'Acme, Inc.' }
  host{ name.gsub(/[\s\.,]+/, '').downcase }
  bill_on{ 1.month.from_now.to_date }
end

require 'authlogic'
require 'faker'
User.blueprint do
  name{ Faker::Name.name }
  password{ 'welcome' }
  password_confirmation{ password }
  email{ "#{name.gsub(/\s+/, '').downcase}@gmail.com" }
  account{ Account.make }
end

Person.blueprint do
  first_name{ Faker::Name.first_name }
  middle_name{ Faker::Name.first_name }
  last_name{ Faker::Name.last_name }
  born_on{ ((18+rand(60)).years.ago + (180-rand(365)).days).to_date }
  street{ Faker::Address.street_address }
  city{ Faker::Address.city }
  state{ Faker::Address.us_state_abbr }
  zip_code{ Faker::Address.zip_code }
end

Agency.blueprint do
  name{ Faker::Lorem.words }
  description{ Faker::Lorem.paragraph }
  street{ Faker::Address.street_address }
  city{ Faker::Address.city }
  state{ Faker::Address.us_state_abbr }
  zip_code{ Faker::Address.zip_code }
end

ManagedCase.blueprint do
  agency
  title{ Faker::Lorem.words }
  reference{ "#{Date.today.year}%04d" % rand(10000) }
  opened_on{ rand(180).days.ago.to_date }
end
