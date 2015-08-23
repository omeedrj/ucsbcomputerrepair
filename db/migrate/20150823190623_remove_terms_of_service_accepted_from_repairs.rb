class RemoveTermsOfServiceAcceptedFromRepairs < ActiveRecord::Migration
  def change
    remove_column :repairs, :terms_of_service_accepted, :boolean
  end
end
