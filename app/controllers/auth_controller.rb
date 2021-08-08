# frozen_string_literal: true

# AuthController
class AuthController < ApplicationController
  skip_before_action :require_login, only: %i[login auto_login]

  def login
    user = User.find_by(username: params[:username])
    measurements = Measurement.all
    if user
      payload = { user_id: user.id }
      token = encode_token(payload)
      render json: { user: user, jwt: token, success: "Welcome, #{user.username}", measurements: measurements }
    else
      render json: { failure: 'Log in failed! Username Invalid!' }
    end
  end

  def auto_login
    measurements = Measurement.all
    if session_user
      render json: { user: session_user, measurements: measurements }
    else
      render json: { errors: 'No User Logged In' }
    end
  end
end
