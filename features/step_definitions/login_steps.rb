require File.join(Rails.root, 'spec', 'blueprints')

Given /^I am a user named (.+)$/ do |user_name|
  login = user_name.gsub(/\s+/, '').downcase
  @user = User.make :name=>user_name, :email=>"#{login}@gmail.com"
  @user.activate
end

Given /^I am logged in$/ do
  visit login_url
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => 'welcome'
  click_button 'Login'
end

