require 'spec_helper'

describe Person do
  before(:each) do
    @valid_attributes = {
      :last_name => "value for last_name",
      :first_name => "value for first_name",
      :middle_name => "value for middle_name",
      :born_on => "value for born_on",
      :street => "value for street",
      :city => "value for city",
      :state => "value for state",
      :zip_code => "value for zip_code",
      :zip4 => "value for zip4"
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ Person.create(@valid_attributes) }.should change(Person, :count).by(1)
  end

  [:last_name, :first_name].each do |required_attr|
    it "should require a #{required_attr}" do
      @valid_attributes.delete required_attr
      lambda{ Person.create @valid_attribtues }.should_not change(Person, :count)
    end
  end

  it "should be able to search by last name" do
    Person.should_receive(:scoped).with(:conditions=>{:last_name=>'Kauffmann'}).once
    Person.search "Kauffmann"
  end

  it "should be able to search by first and last name" do
    Person.should_receive(:scoped).with(:conditions=>{:first_name => 'Donnie', :last_name=>'Kauffmann'}).once
    Person.search "Donnie Kauffmann"
  end
end
