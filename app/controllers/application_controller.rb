class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def confirm_logged_in_user
    unless logged_in?
      store_requested_url
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
