module V1
  class BooksController < ApiController
    include Wor::Paginate
    rescue_from ActiveRecord::RecordInvalid, with: "No Vimo"

    def index
      render_paginated Book
    end

    def show
      render json: Book.find(params[:id])
    end
  end
end
