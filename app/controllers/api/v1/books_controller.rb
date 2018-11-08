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
        book_info = OpenLibraryService.new.book_info(params[:isbn])
        return render json: book_info if book_info.present?

        render json: { error: I18n.t('errors.book.isbn.not_found') }, status: :not_found
      end
    end
  end
end
