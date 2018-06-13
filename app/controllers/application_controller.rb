class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  # Confirms a logged-in users
  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "users.login_msg"
    redirect_to login_url
  end
end
