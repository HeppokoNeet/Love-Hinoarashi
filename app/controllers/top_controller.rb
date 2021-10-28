class TopController < ApplicationController
  def index; end

  def log_out
    session.delete(:user_id)
    current_user = nil
    redirect_to root_path, flash: { error: 'ログアウトしました' }
  end
end
