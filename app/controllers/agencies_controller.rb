class AgenciesController < ApplicationController
  def index
    filter_agencies

    respond_to do |format|
      format.html #
    end
  end

  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new params[:agency]

    respond_to do |format|
      if @agency.save
        flash[:notice] = "#{@agency.name} added."
        format.html{ redirect_to agencies_path }
      else
        format.html{ render :action => :new }
      end
    end
  end

  private
    def filter_agencies
      @agencies = params[:query].blank? ?
        Agency.scoped( :order => :name, :limit => 20 ) :
        Agency.search( params[:query] )
    end

end
