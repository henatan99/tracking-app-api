# frozen_string_literal: true

# Response
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
