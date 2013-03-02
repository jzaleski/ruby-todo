class ApplicationController < ActionController::Base

	protect_from_forgery
	before_filter :ensure_authenticated, :except => :login


	protected

	def ensure_authenticated
		redirect_to '/login' unless user
	end


	def user
		@user ||= User.find(session[:user_id])
	end


	def list
		list_id = params.delete(:list_id) if params[:list_id]
		list_id ||= session[:list_id]
		@list = List.find(list_id)
		if @list.nil?
			@list = List.new("#{user.email}'s list")
			@list.created_by_user = user
			@list.users << user
			@list.save!
		end
		raise 'Unathorized' unless user.can_see?(@list)
		session[:list_id] = @list.id
		@list
	end

end
