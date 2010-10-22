class ManagedCasesController < ApplicationController
  def index
    filter_cases

    respond_to do |format|
      format.html #
    end
  end

  private
    def filter_cases
      if params[:query].blank?
        @managed_cases = [ ]
      else
        @managed_cases = ManagedCase.scoped :conditions => { :agency_id => current_user.agency_ids }
        @managed_cases = @managed_cases.scoped :conditions => ["reference = :ref", { :ref => params[:query]} ]
      end
    end
end

