# frozen_string_literal: true

module ApplicationHelper
  def list
    list_id = params.delete(:list_id) if params[:list_id]
    list_id ||= session[:list_id]
    @list = List.find(list_id) if list_id
    @list ||= user.lists.empty? ? List.new(name: "#{user.email}'s list") : user.lists.first
    if @list.new_record?
      @list.created_by_user = user
      @list.users << user
      @list.save!
    end
    raise 'Unathorized' unless user.can_see?(@list)
    session[:list_id] = @list.id
    @list
  end

  def user
    @user ||= User.find(user_id)
  end

  def user_id
    @user_id ||= session[:user_id]
  end
end
