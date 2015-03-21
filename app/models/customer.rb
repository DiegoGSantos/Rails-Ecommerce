class Customer < ActiveRecord::Base
	has_one :adress
	belongs_to :province
end
