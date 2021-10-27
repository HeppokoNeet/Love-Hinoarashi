class LoginController < ApplicationController
  def index; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      view_context.log_in(user)
      redirect_to root_path, notice: 'ログインしました'
    else
      login_error_text = 'メールアドレスまたはパスワードに誤りがあります'
      flash[:error] = login_error_text
      render 'login/index', layout: 'noHeaderFooter.html.slim'
      return
    end
  end
end
