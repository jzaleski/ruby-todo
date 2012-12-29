class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :current_user
	def current_user
		@current_user = User.find_or_create_by_email_and_encrypted_password(
			'test@test.com',
			Digest::SHA1.hexdigest('test')
		)
	end
end
