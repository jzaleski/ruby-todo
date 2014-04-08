class ApplicationController < ActionController::Base

	protect_from_forgery
	before_filter :ensure_authenticated, :except => :login

	protected

	def ensure_authenticated
		redirect_to '/login' unless session[:user_id]
	end

	def list
		list_id = params.delete(:list_id) if params[:list_id]
		list_id ||= session[:list_id]
		@list = List.find(list_id) if list_id
		@list ||= List.find_or_initialize_by_name("#{user.email}'s list")
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
		@user ||= User.find(session[:user_id])
	end

end
