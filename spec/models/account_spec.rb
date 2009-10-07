require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Account do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :host => 'court.somecounty.org'
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ Account.create(@valid_attributes) }.should change(Account, :count).by(1)
  end

  [:name, :host].each do |required_attr|
    it "should require a #{required_attr}" do
      @valid_attributes.delete required_attr
      lambda{ Account.create(@valid_attributes) }.should_not change(Account, :count)
    end
  end

  it "should be active after creation" do
    @account = Account.create(@valid_attributes)
    @account.should be_active
  end

  it "should be current for billing" do
    @account = Account.create @valid_attributes
    @account.should be_current
  end

  describe "in active state" do
    before :each do 
      @account = Account.create @valid_attributes
      @account.should be_active
    end

    it "should be suspended after suspend!" do
      lambda{ @account.suspend! }.should change(@account, :state).to("suspended")
    end
  end

  describe "when billing is current" do
    before :each do
      @account = Account.create @valid_attributes
      @account.should be_current
    end

    it "should be current if paid in full" do
      lambda{ @account.paid_in_full }.should_not change(@account, :billing_status)
    end

    it "should be past due 30 if marked not paid" do
      lambda{ @account.mark_not_paid! }.should change(@account, :billing_status).to "past_due_30_days"
    end
  end

  describe "when billing is past due 30 days" do
    before :each do 
      @account = Account.create @valid_attributes
      @account.mark_not_paid!
      @account.should be_past_due_30_days
    end

    it "should be current if paid in full" do
      lambda{ @account.paid_in_full }.should change(@account, :billing_status).to( "current" )
    end

    it "should be past due 60 days if marked not paid" do
      lambda{ @account.mark_not_paid! }.should change(@account, :billing_status).to "past_due_60_days"
    end

    it "should be suspended if marked not paid" do
      lambda{ @account.mark_not_paid! }.should change(@account, :state).to( "suspended" )
    end
  end
end
