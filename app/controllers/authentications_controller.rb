class AuthenticationsController < ApplicationController
	skip_before_action :authenticate_user
	def login
		@user = User.find_by_email(params[:email])
		if @user&.authenticate(params[:password])
			byebug
			token = JwtToken.encode(user_id: @user_id)
			byebug
			time = Time.now + 24.hours.to_i
			render json: {token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
			              user_name: @user.user_name}, status: :ok
		else
			render json: {error: 'unauthorized'}, status: :unauthorized
		end
	end

end
