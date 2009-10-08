require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CostCenter do
  before(:each) do
    @valid_attributes = {
      :account => mock_model(Account),
      :name => "value for name"
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ CostCenter.create(@valid_attributes) }.should change(CostCenter, :count).by(1)
  end

  [:account, :name].each do |required_attr|
    it "should require a #{required_attr}" do
      @valid_attributes.delete required_attr
      lambda{ CostCenter.create(@valid_attributes) }.should_not change(CostCenter, :count)
    end
  end
end
