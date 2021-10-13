class LoginController < ApplicationController
  def index
    render layout: 'noHeaderFooter.html.slim'
  end
end
