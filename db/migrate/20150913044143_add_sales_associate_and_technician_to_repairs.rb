class AddSalesAssociateAndTechnicianToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :sales_associate, :string
    add_column :repairs, :technician, :string
  end
end
