module V1
  class ApiController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    before_action :authenticate_user!

    private

    def not_found(exception)
      render json: {
        errors: exception
      }, status: :not_found
    end
  end
end
