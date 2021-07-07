class MeasuredsController < ApplicationController
    # GET /measureds
    def index
        @measureds = User.all
        json_response(@measureds)
    end

    # POST /measureds
    def create
        @measured = User.create!(measured_params)
        json_response(@measured, :created)
    end

    # GET /measureds/:id
    def show
        json_response(@measured)
    end

    # PUT /measureds/:id
    def update
        @measured.update(measured_params)
        head :no_content
    end

    # DELETE /measureds/:id
    def destroy
        @measured.destroy
        head :no_content
    end
end
