class SessionsController < ApplicationController
  skip_before_filter :require_user, [ :new, :create ]
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new params[:user_session]

    respond_to do |format|
      if @user_session.save
        format.html{ redirect_to people_path }
      else
        flash[:error] = 'Could not log in with the email and password provided.'
        format.html{ render :action => :new }
      end
    end
  end

  def destroy
    current_user_session.destroy

    respond_to do |format|
      format.html{ redirect_to login_url }
    end
  end

end
