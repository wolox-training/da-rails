require 'rails_helper'

module Api
  module V1
    describe BooksController type: :controller do
      describe 'GET index' do
        context 'When fetching all books' do
          let!(:books) {create_list(:book, 3)}
          before do 
            get :index, params: {}
          end

          it 'responds with the book json' do
            expected = ActiveModel::Serializer::CollectionSerializer.new(
              books, each_serializer: BookSerializer
            ).to_json

            expect(response_body.to_json)
          end
        end
      end
    end
  end
end
