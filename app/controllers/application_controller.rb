class ApplicationController < ActionController::Base
  before_action :ensure_authenticated, :except => :login

  protected

  include ApplicationHelper

  def ensure_authenticated
    redirect_to '/login' unless user_id
  end
end
