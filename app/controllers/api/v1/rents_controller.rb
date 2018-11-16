module Api
  module V1
    class RentsController < ApiController
      include Wor::Paginate

      before_action :authenticate_api_v1_user!

      def index
        render_paginated current_api_v1_user.rents
      end

      def create
        @rent = authorize Rent.create(rent_params)

        if @rent.persisted?
          RentMailer.rent_created(@rent).deliver_later
          render json: @rent, status: :created
        else
          render json: @rent.errors, status: :unprocessable_entity
        end
      end

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :init_date, :end_date)
      end
    end
  end
end
