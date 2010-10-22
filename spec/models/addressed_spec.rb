describe 'any object with a street address', :shared => true do
  describe '#full_address' do
    before :each do
      @basic_address = "#{@valid_attributes[:street]}, #{@valid_attributes[:city]}, #{@valid_attributes[:state]} #{@valid_attributes[:zip_code]}"
    end

    context 'without zip4' do
      before :each do
        @addressed.zip4 = nil
      end

      it "should concatenate address parts as street, city, state zip" do
        @addressed.full_address.should eql(@basic_address)
      end
    end

    context 'with zip4' do
      before :each do
        @addressed.zip4 = '4065'
      end

      it "should append -zip4" do
        @addressed.full_address.should eql(@basic_address << '-' << @addressed.zip4)
      end
    end

    context 'with a multi-line street address' do
      before :each do
        @addressed.street = <<-EOS
          909 Wesley Court
          Suite C
        EOS
      end

      it "should replace new-line characters with the separator" do
        @addressed.full_address.should eql("#{@addressed.street.gsub("\n", ", ")}, #{@addressed.city}, #{@addressed.state} #{@addressed.zip_code}")
      end
    end
  end
end
