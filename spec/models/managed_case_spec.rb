require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ManagedCase do
  before(:each) do
    @valid_attributes = {
      :agency => mock_model(Agency, 'destroyed?' => false),
      :title => "value for title",
      :reference => "value for reference"
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ ManagedCase.create(@valid_attributes) }.should change(ManagedCase, :count).by(1)
  end

  [:agency, :title].each do |required_attr|
    it "should require a #{required_attr}" do
      @valid_attributes.delete required_attr
      lambda{ ManagedCase.create(@valid_attributes) }.should_not change(ManagedCase, :count)
    end
  end

  it "should be pending after creation" do
    @managed_case = ManagedCase.create(@valid_attributes)
    @managed_case.should be_pending
  end
end
