class RegisterController < ApplicationController
  def index
    @user = User.new
    render layout: 'noHeaderFooter.html.slim'
  end

  def create
    @user = User.new_user(User.user_params(params))
    unless @user.valid?
      render 'register/index', layout: 'noHeaderFooter.html.slim'
      return
    end
    @user.save
    redirect_to root_path, notice: 'ログインしました'
  end
end
