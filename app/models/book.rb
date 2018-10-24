class Book < ApplicationRecord
  validates :gender, :author, :image, :title, :editor, :year, presence: true
  has_many: rents
end
