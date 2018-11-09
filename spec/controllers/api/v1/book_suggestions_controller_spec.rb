require 'rails_helper'

module Api
  module V1
    describe BookSuggestionsController, type: :controller do
      describe 'POST #create' do
        context 'With the correct params' do
          let!(:new_book_suggestions_attributes) do
            { book_suggestion: attributes_for(:book_suggestion) }
          end
          let(:request) { post :create, params: new_book_suggestions_attributes }

          it 'increments the book suggestions counter by one' do
            expect { request }.to change { BookSuggestion.count }.by(1)
          end

          it 'responds with 201 status' do
            request
            expect(response).to have_http_status(:created)
          end
        end

        context 'With the wrong params' do
          let!(:new_book_suggestions_attributes) do
            { book_suggestion: attributes_for(:book_suggestion, price: nil) }
          end
          let(:request) { post :create, params: new_book_suggestions_attributes }

          it 'not increments the book suggestions counter' do
            expect { request }.to change { BookSuggestion.count }.by(0)
          end

          it 'returns unprocessable entity' do
            request
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end
    end
  end
end
