class CreateInformation < ActiveRecord::Migration[7.1]
  def change
    create_table :information do |t|
      t.references :school, null: false, foreign_key: true
      t.string :title, null: false
      t.text :content, null: false
      t.text :tags
      
      t.timestamps  # Cela ajoute déjà created_at et updated_at
    end
  end
end
