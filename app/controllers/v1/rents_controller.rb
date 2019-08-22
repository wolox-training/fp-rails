module V1
  class RentsController < ApiController
    include Wor::Paginate

    def index
      render_paginated Rent
    end

    def create
      rent = Rent.new(rent_params)
      rent.save!
      mail = UserMailer.notice_email(rent)
      mail.deliver_later(wait: 1.second)
      render json: rent, status: :created
    end

    private

    def rent_params
      params.require(:rent).permit(:user_id, :book_id, :start_date, :end_date)
    end
  end
end
