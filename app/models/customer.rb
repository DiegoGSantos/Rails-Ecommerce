class Customer < ActiveRecord::Base
	has_many :addresses
	has_many :payment_details
	belongs_to :province
end
