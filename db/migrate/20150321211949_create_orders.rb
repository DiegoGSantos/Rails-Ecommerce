class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :status
      t.integer :pst_rate
      t.integer :gst_rate
      t.integer :hst_rate

      t.timestamps null: false
    end
  end
end
