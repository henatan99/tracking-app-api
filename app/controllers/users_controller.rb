class UsersController < ApplicationController
  before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    if user.valid? 
      payload = {user_id: user.id}
      token = encode_token(payload)
      render json: {user: user, jwt: token}
    else
      render json: {errors: user.errors.full_message}, status: :not_acceptable
    end
  end

  # GET /users/:id
  def show
    json_response(@user)
    # render json: @user
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
