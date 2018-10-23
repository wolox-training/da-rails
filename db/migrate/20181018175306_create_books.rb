class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :genero, null: false, default: ""
      t.string :autor, null: false, default: ""
      t.string :image, null: false, default: ""
      t.string :titulo, null: false, default: ""
      t.string :editor, null: false, default: ""
      t.string :anio, null: false, default: ""
      t.timestamps
    end
  end
end
