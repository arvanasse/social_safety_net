require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = {
      :email => "person@test.com",
      :account => mock_model(Account, 'destroyed?' => false),
      :password => 'welcome',
      :password_confirmation => 'welcome'
    }
  end

  it "should create a new instance given valid attributes" do
    lambda{ User.create(@valid_attributes) }.should change(User, :count).by(1)
  end

  [:email, :account, :password, :password_confirmation].each do |required_attr|
    it "should require a(n) #{required_attr}" do
      @valid_attributes.delete required_attr
      lambda{ User.create(@valid_attributes) }.should_not change(User, :count)
    end
  end

  it "should be pending after creation" do
    @user = User.create @valid_attributes
    @user.should be_pending
  end

  describe "in the pending state" do
    before :each do 
      @user = User.create @valid_attributes
      @user.should be_pending
    end

    it "should be active after activate!" do
      lambda{ @user.activate! }.should change(@user, :state).to("active")
    end

    it "should be suspended after suspend!" do
      lambda{ @user.suspend! }.should change(@user, :state).to("suspended")
    end

    it "should be deleted after destroy" do
      lambda{ @user.destroy }.should change(@user, :state).to("deleted")
    end
  end

  describe "in the active state" do
    before :each do
      @user = User.create(@valid_attributes)
      @user.activate!
      @user.should be_active
    end

    it "should be suspended after suspend!" do
      lambda{ @user.suspend! }.should change(@user, :state).to( "suspended" )
    end

    it "should be deleted after destroy" do
      lambda{ @user.destroy }.should change(@user, :state).to( "deleted" )
    end
  end

  describe "in the suspended state" do
    before :each do 
      @user = User.create(@valid_attributes)
      @user.suspend!
      @user.should be_suspended
    end

    it "should be active after activate!" do
      lambda{ @user.activate! }.should change(@user, :state).to( "active" )
    end

    it "should be deleted after destroy" do
      lambda{ @user.destroy }.should change(@user, :state).to( "deleted" )
    end
  end

  describe "after destroy" do
    before :each do
      @user = User.create @valid_attributes
      @user.destroy
      @user.should be_deleted
    end

    it "should be active after activate!" do
      lambda{ @user.activate! }.should change(@user, :state).to( "active" )
    end
  end
end
