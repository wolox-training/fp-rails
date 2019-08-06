require 'rails_helper'

describe V1::BooksController do
  describe 'GET #index' do
    subject(:http_request) { get :index }

    let!(:books) { create_list(:book, 5) }

    context 'without authenticated user' do
      it 'responds with status 401 (UNAUTHORIZED)' do
        expect(http_request).to have_http_status(:unauthorized)
      end
    end

    context 'When fetching all the books' do
      include_context 'authenticated user'

      it 'responses with books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(http_request.body) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end

      it 'responds with pagination' do
        expect(JSON.parse(http_request.body)['page']).not_to be_empty
      end
    end
  end

  describe 'GET #show' do
    subject(:http_request) { get :show, params: { id: book_id } }
    let!(:book) { create(:book) }

    context 'When fetching a book' do
      include_context 'authenticated user'
      let(:book_id) { book.id }

      it 'responses with the user rent json' do
        expect(http_request.body).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(http_request).to have_http_status(:ok)
      end
    end

    context 'with an unexistent book' do
      include_context 'authenticated user'
      let(:book_id) { Book.last.id + 1 }

      it 'responds to bad parameters with status 404 (NOT FOUND)' do
        expect(http_request).to have_http_status(:not_found)
      end
    end

    context 'with an invalid book id' do
      include_context 'authenticated user'
      let(:book_id) { nil }

      it 'responds to bad parameters with status 400 (BAD REQUEST)' do
        expect(http_request).to have_http_status(:bad_request)
      end
    end
  end
end
