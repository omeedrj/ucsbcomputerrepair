class SessionsController < ApplicationController
  def new
  	if logged_in?
  		redirect_to active_repairs_path
  	end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to active_repairs_path
    else
      flash.now[:incorrect] = "· Invalid username/password combination"
      
      render :new
    end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end

  def newViewOnlySession
    user = User.find_by(username: "ExampleViewOnlyAccount")
    if user
      log_in user
      redirect_to active_repairs_path
    else
      # TODO: make sure this error message can show up
      flash.now[:incorrect] = "· View Only Account does not exist"

      redirect_to :back
    end
  end
end
