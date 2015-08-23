class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string  :customer_first_name
      t.string  :customer_last_name
      t.string  :customer_id_number
      t.string  :customer_email
      t.string  :customer_phone_number
      t.text    :device_description
      t.string  :device_serial_number
      t.string 	:device_password
      t.text    :accessories_description
      t.text	  :device_problem_description
      t.text    :repair_description
      t.decimal :services_fee, :precision => 8, :scale => 2, :default => 0.00
      t.decimal :parts_fee, :precision => 8, :scale => 2, :default => 0.00
      t.integer :status, :default => 0
      t.boolean :terms_of_service_accepted, :default => false

      t.timestamps null: false
    end
  end
end
