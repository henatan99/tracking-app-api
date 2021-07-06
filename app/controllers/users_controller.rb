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
        json_response(@user, :created)
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
        # whielist params
        params.permit(:username)
    end

    def find_user
        user = User.find(params[:id])
    end
end
