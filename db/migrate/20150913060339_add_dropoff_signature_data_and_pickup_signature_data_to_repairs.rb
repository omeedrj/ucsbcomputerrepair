class AddDropoffSignatureDataAndPickupSignatureDataToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :dropoff_signature_data, :text
    add_column :repairs, :pickup_signature_data, :text
  end
end
