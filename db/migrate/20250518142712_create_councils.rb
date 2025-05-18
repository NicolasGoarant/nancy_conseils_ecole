class CreateCouncils < ActiveRecord::Migration[8.0]
  def change
    create_table :councils do |t|
      t.references :school, null: false, foreign_key: true
      t.string :title
      t.datetime :date
      t.string :start_time
      t.string :end_time
      t.string :location
      t.string :academic_year
      t.integer :term
      t.text :agenda
      t.text :documents

      t.timestamps
    end
  end
end
