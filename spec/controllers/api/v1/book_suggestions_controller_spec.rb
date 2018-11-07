require 'rails_helper'

module Api
  module V1
    describe BookSuggestionsController, type: :controller do
      describe 'POST #create' do
        context 'When the booksuggestions was created' do
          let!(:new_book_suggestions_attributes) do
            { book_suggestion: attributes_for(:book_suggestion) }
          end
          let(:request) { post :create, params: new_book_suggestions_attributes }

          it 'It was created sucessfull' do
            expect { request }.to change { BookSuggestion.count }.by(1)
          end

          it 'responds with 201 status' do
            request
            expect(response).to have_http_status(:created)
          end
        end

        context 'When creating an invalid book suggestion' do
          let!(:new_book_suggestions_attributes) do
            { book_suggestion: attributes_for(:book_suggestion, price: nil) }
          end
          let(:request) { post :create, params: new_book_suggestions_attributes }

          it 'It was not created because the price is nil' do
            expect { request }.to change { BookSuggestion.count }.by(0)
          end

          it 'returns error view' do
            request
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end
    end
  end
end
