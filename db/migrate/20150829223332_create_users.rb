class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :reset_digest
      t.string :username
      t.integer :role, :default => 1
      t.string :website_code

      t.timestamps null: false
    end
  end
end
