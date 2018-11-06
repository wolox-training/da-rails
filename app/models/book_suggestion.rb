class BookSuggestion < ApplicationRecord
  validates :price, :author, :title, :link, :editor, :year, presence: true, allow_blank: false
  belongs_to :user
end
