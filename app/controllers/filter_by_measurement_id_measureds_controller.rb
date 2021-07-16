class FilterByMeasurementIdMeasuredsController < ApplicationController
    before_action :set_user
    before_action :set_measurements

    def index
        @measureds_by_measurement = []
        @measurements.each do |measurement|
            filtered = @user.measureds.map { |measured| 
            @measureds_by_measurement.push(
                {:key => "#{measured.measurement_id}", :value => measured}
                ) if measured.measurement_id == measurement.id
        }
        end
        @measureds_by_measurement
        json_response(@measureds_by_measurement)
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
        @measurements =  Measurement.all
    end

    def set_user_measureds
        @filtereds = @user.measureds.by_measurement(params[:measurement_id])
    end 
end
