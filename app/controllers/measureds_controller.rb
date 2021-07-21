class MeasuredsController < ApplicationController
  # GET /measureds
  before_action :set_user
  # before_action :set_measurement
  before_action :set_user_measured, only: [:show, :update, :destroy]

  # GET /users/:user_id/measureds
  def index
    # json_response(@user.measureds)
    render json: {measureds: @user.measureds, goals: @user.goals}
  end

  # POST /users/:user_id/measureds
  def create
    # @measured = Measured.create!(measured_params)
    @user.measureds.create!(measured_params)
    json_response(@measured, :created)
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
