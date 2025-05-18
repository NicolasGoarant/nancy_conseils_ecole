class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|  # Changez "information" en "reports"
      t.references :council, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :summary, null: false
      t.text :issues
      t.text :follow_up
      t.boolean :submitted, default: false
      
      t.timestamps
    end
  end
end
