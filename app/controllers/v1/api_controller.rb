module V1
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
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

    def not_found(exception)
      render json: {
        errors: exception
      }, status: :not_found
    end
  end
end
