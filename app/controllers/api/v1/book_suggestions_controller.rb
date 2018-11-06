module Api
  module V1
    class BookSuggestionsController < ApplicationController

      def create
        @bookSugesstion = BookSuggestion.create(book_suggestion_params)
        return render json:  @bookSuggestion, status: :created if @bookSugesstion.persisted?
        render json: @bookSuggestion.erros
      end

      def book_suggestion_params
        params.require(:book_suggestion).permit(:synopsis, :price, :author, :title, :link, :edithor, :year, :user_id)
      end
    end
  end
end
