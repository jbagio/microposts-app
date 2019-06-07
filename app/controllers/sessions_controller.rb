class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    @user = User.find_by(email: email)

    if @user&.authenticate(password)
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user # shorthand for redirect_back_or user_url(@user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
