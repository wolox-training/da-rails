module Api
  module V1
    class BookSuggestionsController < ApiController
      def create
        @book_sugesstion = BookSuggestion.create(book_suggestion_params)
        return render status: :created, json: @book_sugesstion if @book_sugesstion.persisted?

        render json: @book_sugesstion.errors, status: :unprocessable_entity
      end

      def book_suggestion_params
        params.require(:book_suggestion).permit(:synopsis, :price, :author, :title, :link, :editor,
                                                :year, :user_id)
      end
    end
  end
end
