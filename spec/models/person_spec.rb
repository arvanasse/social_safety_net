require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

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

  describe '#full_name' do
    before :each do
      @valid_attributes.merge! :first_name => 'Alan', :last_name => 'Watterfield'
      @person = Person.new( @valid_attributes )
    end

    it "should concatenate the first and last name" do
      @person.full_name.should == "#{@valid_attributes[:first_name]} #{@valid_attributes[:last_name]}"
    end
  end

  describe '#full_address' do
    before :each do
      @valid_attributes.merge! :street => '207 S. Staghorn Ln', :city => 'Greer', :state => 'SC', :zip_code => '29650', :zip4 => nil
      @person = Person.new @valid_attributes
      @basic_address = "#{@valid_attributes[:street]}, #{@valid_attributes[:city]}, #{@valid_attributes[:state]} #{@valid_attributes[:zip_code]}"
    end

    it "should concatenate address parts as street, city, state zip" do
      @person.full_address.should eql(@basic_address)
    end

    context 'with zip4' do
      before :each do
        @person.zip4 = '4065'
      end

      it "should append -zip4" do
        @person.full_address.should eql(@basic_address << '-' << @person.zip4)
      end
    end

    context 'with a multi-line street address' do
      before :each do
        @person.street = <<-EOS
          909 Wesley Court
          Suite C
        EOS
      end

      it "should replace new-line characters with the separator" do
        @person.full_address.should eql("#{@person.street.gsub("\n", ", ")}, #{@person.city}, #{@person.state} #{@person.zip_code}")
      end
    end
  end
end
