# FilterByDateMeasuredsController
class FilterByDateMeasuredsController < ApplicationController
  before_action :set_user
  before_action :set_measurements

  def index
    @measureds_by_date = []
    @user.measureds.measureds_dates(@user).each do |date|
      @user.measureds.order_by_date.map do |measured|
        @measureds_by_date.push(
          { key: date.to_s, value: measured }
        )
      end
    end
    json_response(@measureds_by_date)
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
