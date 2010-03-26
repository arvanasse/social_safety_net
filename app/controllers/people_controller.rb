class PeopleController < ApplicationController
  def index
    filter_people

    respond_to do |format|
      format.html #
    end
  end

  private
    def filter_people
      @people = params[:query].blank? ? 
        Person.scoped( :order=>'last_name, first_name', :limit => 20 ) :
        Person.search( params[:query] )
    end
end
