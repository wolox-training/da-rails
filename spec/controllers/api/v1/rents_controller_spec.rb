require 'rails_helper'

module Api
  module V1
    describe RentsController, type: :controller do
      include_context 'Authenticated User'
      describe 'POST #create' do
        context 'With the correct params' do
          let!(:book) { create(:book) }
          let!(:new_rent_attributes) do
            { rent: attributes_for(:rent, user_id: user.id, book_id: book.id), user_id: user.id }
          end
          let(:create_request) { post :create, params: new_rent_attributes }

          it 'Increments the Rent count by one' do
            expect { create_request }.to change { Rent.count }.by(1)
          end

          it 'responds with 201 status' do
            create_request
            expect(response).to have_http_status(:created)
          end
        end
        context 'With the wrong params' do
          let!(:new_rent_attributes) do
            { rent: attributes_for(:rent, user_id: user.id), user_id: user.id }
          end
          let(:create_request) { post :create, params: new_rent_attributes }

          it 'Not increments the Rent count' do
            expect { create_request }.to change { Rent.count }.by(0)
          end

          it 'responds with 422 status' do
            create_request
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
        context 'With an unauthorized user for the rent' do
          let!(:other_user) { create(:user) }
          let!(:new_rent_attributes) do
            { rent: attributes_for(:rent, user_id: other_user.id), user_id: user.id }
          end
          let(:create_request) { post :create, params: new_rent_attributes }

          it 'Sending a Pundit::NotAuthorizedError' do
            create_request
            expect(response).to have_http_status(:unauthorized)
          end
        end
      end
    end
  end
end
