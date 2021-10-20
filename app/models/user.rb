class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.user_params(params)
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation)
  end

  def self.new_user(user_params)
    @user = User.new(user_params)
  end

  def valid_of_specified?(*columns)
    columns.each do |column|
      return false if self.errors.messages.include?(column)
    end
    true
  end
end
