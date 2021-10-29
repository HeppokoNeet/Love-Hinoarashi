class ApplicationController < ActionController::Base
  private

  def logged_in_user
    redirect_to login_url unless logged_in?
  end
end
