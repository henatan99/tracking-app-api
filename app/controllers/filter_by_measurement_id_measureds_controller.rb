# frozen_string_literal: true

# FilterByMeasurementIdMeasuredsController
class FilterByMeasurementIdMeasuredsController < ApplicationController
  before_action :set_user
  before_action :set_measurements

  def index
    @measureds_by_measurement = []
    @measurements.each do |measurement|
      filtered = @user.measureds.order_by_measurement_id.select do |measured|
        measurement.id == measured.measurement_id
      end
      @measureds_by_measurement.push(filtered) if filtered
    end
    # json_response(@measureds_by_measurement)
    render json: { measureds_by_measurement: @measureds_by_measurement, goals: @user.goals }
  end

  def show
    json_response(@filtereds)
  end

  private

  def measured_params
    params.permit(:user_id, :measurement_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_measurements
    @measurements = Measurement.all
  end

  def set_user_measureds
    @filtereds = @user.measureds.by_measurement(params[:measurement_id])
  end
end
