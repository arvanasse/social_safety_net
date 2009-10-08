require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CaseHistory do
  before(:each) do
    @valid_attributes = {
      :managed_case => mock_model(ManagedCase),
      :added_on => Date.today,
      :due_on => Date.today,
      :completed_on => Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ CaseHistory.create(@valid_attributes) }.should change(CaseHistory, :count).by(1)
  end

  it "should belong to a Managed Case" do
    @valid_attributes.delete :managed_case
    lambda{ CaseHistory.create(@valid_attributes) }.should_not change(CaseHistory, :count)
  end

  it "should be pending when added" do
    @case_history = CaseHistory.create(@valid_attributes)
    @case_history.should be_pending
  end

  describe "in the pending state" do
    before :each do
      @case_history = CaseHistory.create(@valid_attributes.except(:completed_on))
      @case_history.should be_pending
    end

    it "should be complete after complete!" do
      @case_history.complete
      @case_history.should be_complete
    end

    it "should set the completion date after complete!" do
      lambda{ @case_history.complete }.should change(@case_history, :completed_on).from(nil).to(Date.today)
    end
  end
end
