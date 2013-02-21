class ApplicationController < ActionController::Base

	protect_from_forgery
	before_filter :ensure_authenticated, :except => [:login]


	protected

	def ensure_authenticated
		return redirect_to '/login' unless user
	end


	def user
		@user ||= User.find(session[:user_id]) if session[:user_id]
	end


	def list
		if request[:list_id]
			@list = List.find(request[:list_id])
			session[:list_id] = request[:list_id]
		end
		@list ||= List.find(session[:list_id]) if session[:list_id]
		if @list.nil?
			@list = List.find_or_initialize_by_name("#{user.email}'s list")
			if @list.new_record?
				@list.created_by_user = user
				@list.users << user
				@list.save!
			end
		end
		@list
	end

end
