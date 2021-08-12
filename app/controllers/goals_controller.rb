# GoalsController
class GoalsController < ApplicationController
  # GET /measureds
  before_action :set_user
  before_action :set_user_goal, only: %i[show update destroy]

  # GET /users/:user_id/measureds
  def index
    json_response(@user.goals)
  end

  # POST /users/:user_id/measureds
  def create
    @user.goals.create!(goals_params)
    json_response(@goal, :created)
  end

  # GET /users/:user_id/measureds/:id
  def show
    json_response(@goal)
  end

  # PUT /users/:user_id/measureds/:id
  def update
    @goal.update(goal_params)
    head :no_content
  end

  # DELETE users/:user_id/measureds/:id
  def destroy
    @goal.destroy
    head :no_content
  end

  private

  def goals_params
    params.permit(:quantity, :day_one, :day_last, :user_id, :measurement_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_goal
    @goal = @user.goals.find_by!(id: params[:id]) if @user
  end
end
