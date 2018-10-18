class ChangeFieldsBook < ActiveRecord::Migration[5.2]
  def change
    change_table :books do |t|
      t.rename :genero, :gender
      t.rename :autor, :author
      t.rename :titulo, :title
      t.rename :anio, :year
    end
  end
end
