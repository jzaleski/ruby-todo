class AuthenticationController < ApplicationController
  def login
    session[:user_id] = User.last.id unless session.include?(:user_id)
    redirect_to todos_path
  end
end
