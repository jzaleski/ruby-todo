class AuthenticationController < ApplicationController

	def login
		if request.post?
			user = User.find_by_email_and_password(params[:email], Digest::SHA1.hexdigest(params[:password]))
			if user
				session[:user_id] = user.id
				return redirect_to todos_path
			end
			flash[:error] = 'Invalid email and/or password'
		end
	end

end
