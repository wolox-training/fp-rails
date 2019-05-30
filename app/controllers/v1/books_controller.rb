module V1
  class BooksController < ApiController
    include Wor::Paginate

    def index
      render_paginated Book.all
    end

    def show
      render json: Book.find(params[:id])
    end
  end
end
