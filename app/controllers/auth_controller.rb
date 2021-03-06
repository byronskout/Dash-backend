class AuthController < ApplicationController

    def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: { jwt: token, username: user.username }
    else
      render json: { error: "The token couldn't be created. Login failed."}
    end
  end

  def show
    if logged_in
      render json: get_current_user
    else
      render json: {error: "Try again!"}
    end
  end
end
