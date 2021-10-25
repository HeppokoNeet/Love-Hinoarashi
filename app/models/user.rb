class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email,
            presence: true,
            format: {
              with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
              message: '「メールアドレスの形式」が正しくありません',
            }
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.user_params(params)
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation)
  end

  def self.new_user(user_params)
    existing_user = User.find_by(email: user_params[:email])
    if existing_user.present?
      return existing_user
    else
      @user = User.new(user_params)
    end
  end

  def valid_of_specified?(*columns)
    columns.each do |column|
      return false if self.errors.messages.include?(column)
    end
    true
  end
end
