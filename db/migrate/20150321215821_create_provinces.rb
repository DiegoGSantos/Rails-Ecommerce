class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :province_name
      t.string :short_name
      t.integer :pst_rate
      t.integer :gst_rate
      t.integer :hst_rate

      t.timestamps null: false
    end
  end
end
