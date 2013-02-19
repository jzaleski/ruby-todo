class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :current_user_and_list
	# XXX: until a work-flow is in place boot-strap the current_user & current_list here
	def current_user_and_list
		@user = User.find_or_create_by_email('test@test.com')
		@list = List.find_or_initialize_by_name("#{@user.email}'s list")
		if @list.new_record?
			@list.created_by_user = @user
			@list.users << @user
			@list.save!
		end
	end
end
