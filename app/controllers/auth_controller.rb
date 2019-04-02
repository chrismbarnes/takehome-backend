class AuthController < ApplicationController
	skip_before_action :authorize_request

  def authenticate
  	user = User.find_by(username: params[:username])

  	if user && user.authenticate(params[:password])
  		jwt = encode_token(user_id: user.id)
  		render json: { token: jwt }
  	else
  		render json: { error: "invalid username or password" }, status: 401
  	end
  end

  private

  def encode_token(data)
  	JWT.encode(data, Rails.application.secrets.secret_key_base)
  end
end
