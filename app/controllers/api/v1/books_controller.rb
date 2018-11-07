module Api
  module V1
    class BooksController < ApiController
      include Wor::Paginate
      before_action :authenticate_api_v1_user!

      def index
        render_paginated Book, each_serializer: BookSerializer
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end

      def isbn
        book_info = OpenLibraryService.new().book_info('0201558025') 
        render json: book_info
      end
    end
  end
end
