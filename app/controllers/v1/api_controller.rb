module V1
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :authenticate_user!
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActionController::ParameterMissing, with: :parameter_missing

    private

    def record_invalid(exception)
      render json: {
        errors: [
          exception.message
        ]
      }, status: :unprocessable_entity
    end

    def parameter_missing(exception)
      render json: {
        errors: [
          exception.message
        ]
      }, status: :bad_request
    end
  end
end
