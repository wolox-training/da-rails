class Book < ApplicationRecord
  validates :gender, :author, :image, :title, :editor, :year, presence: true
end
