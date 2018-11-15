module Api
  module V1
    class UsersController < ApiController
      include Wor::Paginate

      def index
        render_paginated User
      end

    end
  end
end
