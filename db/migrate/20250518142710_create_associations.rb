class CreateAssociations < ActiveRecord::Migration[7.1]  # La version peut être différente
  def change
    create_table :associations do |t|
      t.references :school, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true  # Changé 'official' en 'user'
      t.boolean :active, default: true
      t.datetime :assigned_at

      t.timestamps
    end
  end
end
