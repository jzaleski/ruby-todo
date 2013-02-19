class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :current_user_and_list
	# XXX: until a work-flow is in place boot-strap the current_user & current_list here
	def current_user_and_list
		@current_user = User.find_or_create_by_email('test@test.com')
		@current_list = List.find_or_initialize_by_name("#{@current_user.email}'s list")
		if @current_list.new_record?
			@current_list.created_by_user = @current_user
			@current_list.users << @current_user
			@current_list.save!
		end
	end
end
