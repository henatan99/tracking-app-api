# MeasuredsController
class MeasuredsController < ApplicationController
  # GET /measureds
  before_action :set_user
  # before_action :set_measurement
  before_action :set_user_measured, only: %i[show update destroy]

  # GET /users/:user_id/measureds
  def index
    # json_response(@user.measureds)
    render json: { measureds: @user.measureds, goals: @user.goals }
  end

  # POST /users/:user_id/measureds
  def create
    if Goal.all.goals_measurement_ids(@user).include?(measured_params[:measurement_id])
      @user.measureds.create!(measured_params)
      json_response(@measured, :created)
    else
      render json: { failure: 'Goal not created!' }
    end
  end

  # GET /users/:user_id/measureds/:id
  def show
    json_response(@measured)
  end

  # PUT /users/:user_id/measureds/:id
  def update
    @measured.update(measured_params)
    head :no_content
  end

  # DELETE users/:user_id/measureds/:id
  def destroy
    @measured.destroy
    head :no_content
  end

  private

  def measured_params
    params.permit(:value, :user_id, :measurement_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_measured
    @measured = @user.measureds.find_by!(id: params[:id]) if @user
  end
end
