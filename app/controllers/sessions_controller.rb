class SessionsController < ApplicationController
  def new; end

  def create
    session_params = params[:session]
    user = User.find_by(email: session_params[:email].downcase)
    if user&.authenticate(session_params[:password])
      log_in user
      session_params[:remember_me] == Settings.check ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = t "pages.flash.invalid"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
