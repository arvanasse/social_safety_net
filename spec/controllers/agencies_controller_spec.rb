require 'spec_helper'

describe AgenciesController do

  #Delete these examples and add some real ones
  it "should use AgenciesController" do
    controller.should be_an_instance_of(AgenciesController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
end
