class MeasurementsController < ApplicationController
    # GET /measurements
    def index
        @measurements = Measurement.all
        json_response(@measurements)
    end

    # POST /measurements
    def create
        @measurement = Measurement.create!(measurement_params)
        json_response(@Measurement, :created)
    end

    # GET /measurements/:id
    def show
        json_response(@measurement)
    end

    # PUT /measurements/:id
    def update
        @measurement.update(measurement_params)
        head :no_content
    end

    # DELETE /measurements/:id
    def destroy
        @measurement.destroy
        head :no_content
    end
end
