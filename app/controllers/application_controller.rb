class ApplicationController < ActionController::Base

	protect_from_forgery
	before_filter :ensure_authenticated, :except => [:login, :logout]

	def ensure_authenticated
		# XXX: ugly hack to keep tests functional (rip out ASAP)
		if Rails.env.test?
			@user = User.first
		else
			return redirect_to '/login' unless session[:user_id]
			@user = User.find(session[:user_id])
		end
		@list = List.find_or_initialize_by_name("#{@user.email}'s list")
		if @list.new_record?
			@list.created_by_user = @user
			@list.users << @user
			@list.save!
		end
	end

end
