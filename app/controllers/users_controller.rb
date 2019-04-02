class UsersController < ApplicationController
	skip_before_action :authorize_request, only: [:create]

  def create
  	if params[:username].blank?
  		render json: { error: "Username cannot be blank"}
  	elsif user = User.find_by(username: params[:username])
  		render json: { error: "That username is taken"}
  	else
  		user = User.create(username: params[:username], password: params[:password])
  		render json: { message: "User created"}
  	end
  end
  
end
