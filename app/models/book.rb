class Book < ApplicationRecord
    validates :genero, :autor, :image, :titulo, :editor, :anio, presence: true
end
