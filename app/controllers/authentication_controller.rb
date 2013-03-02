class AuthenticationController < ApplicationController

	def login
		if request.post?
			user = User.where(
				'LOWER(email) = ? AND password = ?',
				params[:email].downcase,
				Digest::SHA1.hexdigest(params[:password])
			).first
			if user
				session[:user_id] = user.id
				return redirect_to todos_path
			end
			flash[:error] = 'Invalid email and/or password'
		end
	end

end
