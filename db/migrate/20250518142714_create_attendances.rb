class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.references :council, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true  # Assurez-vous que c'est 'user' et non 'official'
      t.string :status, default: 'pending'
      
      t.timestamps  # Cela ajoute déjà created_at et updated_at
    end
  end
end
