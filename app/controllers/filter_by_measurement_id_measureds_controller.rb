class FilterByMeasurementIdMeasuredsController < ApplicationController
    before_action :set_user
    before_action :set_measurements

    def index
        @measureds_by_measurement = []
        @measurements.each do |measurement|
            filtered = @user.measureds.select { |measured| measured.measurement_id == measurement.id }
            @measureds_by_measurement.push(filtered)
        end
        json_response(@measureds_by_measurement)
    end

    private

    def set_user
        @user = User.find(params[:user_id])
    end

    def set_measurements
        @measurements =  Measurement.all
    end
end
