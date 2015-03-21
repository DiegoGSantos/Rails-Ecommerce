class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|
      t.integer :customer_id
      t.string :card_holder_name
      t.string :card_number_string
      t.string :card_valid_date

      t.timestamps null: false
    end
  end
end
