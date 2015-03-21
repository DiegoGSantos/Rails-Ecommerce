class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.string :description
      t.text :description_long
      t.integer :price
      t.integer :stock_quantity
      t.string :image_url

      t.timestamps null: false
    end
  end
end
