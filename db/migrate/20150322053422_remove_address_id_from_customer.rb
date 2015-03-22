class RemoveAddressIdFromCustomer < ActiveRecord::Migration
  def change
    remove_column :customers, :address_id, :integer
  end
end
