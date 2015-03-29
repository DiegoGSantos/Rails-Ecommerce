class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :Address
      t.string :city
      t.string :phone
      t.string :email
      t.string :working_time

      t.timestamps null: false
    end
  end
end
