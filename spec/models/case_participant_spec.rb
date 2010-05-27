require 'spec_helper'

describe CaseParticipant do
  before(:each) do
    @valid_attributes = {
      :managed_case => mock_model(ManagedCase, 'destroyed?'=>false),
      :participant  => mock_model(Person, 'destroyed?' => false)
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ CaseParticipant.create(@valid_attributes) }.should change(CaseParticipant, :count).by(1)
  end

  [ :managed_case, :participant ].each do |required_attr|
    it "should require a #{required_attr}" do
      @valid_attributes.delete required_attr
      lambda{ CaseParticipant.create(@valid_attributes) }.should_not change(CaseParticipant, :count)
    end
  end
end
