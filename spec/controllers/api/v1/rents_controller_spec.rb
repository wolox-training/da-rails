require 'rails_helper'

module Api
  module V1
    describe RentsController, type: :controller do
      include_context 'Authenticated User'
      describe 'POST #create' do
        context 'With the correct params' do
          let!(:new_rent_attributes) do
            { rent: attributes_for(:rent, user: user), user_id: user.id }
          end
          let(:request) { post :create, params: new_rent_attributes }

          it 'Increments the Rent count by one' do
            expect { request }.to change { Rent.count }.by(1)
          end

          it 'responds with 201 status' do
            request
            expect(response).to have_http_status(:created)
          end
        end
      end
    end
  end
end
