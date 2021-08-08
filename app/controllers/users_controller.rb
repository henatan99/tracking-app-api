# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  before_action :find_user, except: %i[create index]
  skip_before_action :require_login, only: [:create]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
    measurements = Measurement.all
    @user = User.create!(user_params)
    if @user.valid?
      payload = { user_id: @user.id }
      token = encode_token(payload)
      render json: { user: @user, jwt: token, success: "Welcome, #{@user.username}", measurements: measurements }
    else
      render json: { errors: @user.errors.full_message }, status: :not_acceptable
    end
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.permit(:username)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
