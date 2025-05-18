class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :role
      t.string :commission
      t.string :profile_image

      t.timestamps
    end
  end
end
