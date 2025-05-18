class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :type
      t.string :director_name
      t.string :phone
      t.string :email
      t.integer :class_count
      t.integer :student_count
      t.integer :teacher_count
      t.string :image

      t.timestamps
    end
  end
end
