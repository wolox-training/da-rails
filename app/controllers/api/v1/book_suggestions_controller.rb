module Api
  module V1
    class BookSuggestionsController < ApplicationController

      def create
        puts book_suggestion_params
        @bookSugesstion = BookSuggestion.create(book_suggestion_params)
        #if @bookSugesstion.persisted? then
        #  return render json:  @bookSuggestion, status: :created 
        #else 
        #  render json: @bookSuggestion.erros
        #end
        render json: BookSuggestion.create(book_suggestion_params)
      end

      def book_suggestion_params
        params.require(:book_suggestion).permit(:synopsis, :price, :author, :title, :link, :editor, :year, :user_id)
      end
    end
  end
end
