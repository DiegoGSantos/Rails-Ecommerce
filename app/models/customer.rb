class Customer < ActiveRecord::Base

	has_many :addresses
	has_many :payment_details
	has_many :orders
	belongs_to :province
end
