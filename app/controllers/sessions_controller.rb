class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        flash[:success] = "Bienvenue sur EventBrite"
        redirect_to user
      else
        flash.now[:danger] = "Mauvaise combinaison email/password"
        render 'new'
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def new
  end
  
end
