class AddCustomerIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :customer_id, :integer
  end
end
