require 'rails_helper'

module Api
  module V1
    describe BooksController, type: :controller do
      
      include_context 'Authenticated User'

      describe 'GET #index' do
        context 'When fetching all books' do
          let!(:books) {create_list(:book, 3, user: user)}
          before do 
            get :index, params: { id: user.id }
          end
    
          it 'responds with the book json' do
            expected = ActiveModel::Serializer::CollectionSerializer.new(
              books, each_serializer: BookSerializer
            ).to_json
    
            expect(JSON.parse(response.body)) =~ JSON.parse(expected)
          end
    
          it 'responds with 200 status' do
            expect(response).to have_http_status(:ok)
          end
        end
      end
    
      describe 'GET #show' do
        context 'When fetching a book' do
          let!(:book) { create(:book, user: user) }
    
          before do
            get :show, params: { user_id: user.id, id: book.id }
          end
    
          it 'responses with the book json' do
            expect(JSON.parse(response.body)).to eq BookSerializer.new(
              book, root: false
            ).to_json
          end
    
          it 'responds with 200 status' do
            expect(response).to have_http_status(:ok)
          end
        end
      end
    end    
  end
end
