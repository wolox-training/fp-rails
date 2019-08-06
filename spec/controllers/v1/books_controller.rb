require 'rails_helper'

describe V1::BooksController do
  describe 'GET #index' do
    context 'without authenticated user' do
      subject!(:http_request) { get :index }

      let!(:books) { create_list(:book, 5) }

      it 'responds with status 401 (UNAUTHORIZED)' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'When fetching all the books' do
      include_context 'authenticated user'
      subject!(:books) { create_list(:book, 3) }

      before do
        get :index
      end

      it 'responses with books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responds with pagination' do
        expect(JSON.parse(response.body)['page']).not_to be_empty
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      include_context 'authenticated user'
      let!(:book) { create(:book) }

      before do
        get :show, params: { id: book.id }
      end

      it 'responses with the user rent json' do
        expect(response.body).to eq BookSerializer.new(
          book, root: false
        ).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with an unexistent book' do
      include_context 'authenticated user'

      it 'responds to bad parameters with status 400 (BAD REQUEST)' do
        expect { get :show, params: { id: nil } }
          .to raise_error(ActionController::UrlGenerationError)
      end
    end
  end
end
