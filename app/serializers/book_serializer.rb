class BookSerializer < ActiveModel::Serializer
  attributes :id, :gender, :author, :image, :title, :editor, :year
end
