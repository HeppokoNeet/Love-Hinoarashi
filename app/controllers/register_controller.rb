class RegisterController < ApplicationController
  # before_action :logged_in_user, only:[:アクションたち]
  def index
    @user = User.new
    render layout: 'noHeaderFooter.html.slim'
  end

  def create
    @user = User.new_user(User.user_params(params))
    if @user.id.present?
      error_text = 'すでにメールアドレスの登録があります、ログインしてください'
      flash[:error] = error_text
      render 'login/index', layout: 'noHeaderFooter.html.slim'
      return
    end
    if !@user.valid?
      render 'register/index', layout: 'noHeaderFooter.html.slim'
      return
    end
    @user.save
    redirect_to root_path, notice: 'ログインしました'
  end
end
