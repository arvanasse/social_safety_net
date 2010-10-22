require 'spec_helper'
require File.expand_path(File.dirname(__FILE__) + '/addressed_spec')

describe Agency do
  before(:each) do
    @valid_attributes = {
      :account => mock_model(Account, 'destroyed?' => false),
      :name => "value for name",
      :description => "value for description",
      :street => "value for street",
      :city => "value for city",
      :state => "value for state",
      :zip_code => "value for zip_code"
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ Agency.create(@valid_attributes) }.should change(Agency, :count).by(1)
  end

  it "should require a name" do
    @valid_attributes.delete :name
    lambda{ Agency.create(@valid_attributes) }.should_not change(Agency, :count)
  end

  context 'when valid' do
    before :each do
      @address_attributes = { 
        :street => '207 S. Staghorn Ln', 
        :city => 'Greer', 
        :state => 'SC', 
        :zip_code => '29650', 
        :zip4 => nil 
      }

      @addressed = Agency.new @valid_attributes.merge! @address_attributes
    end

    it_should_behave_like 'any object with a street address'
  end

end
