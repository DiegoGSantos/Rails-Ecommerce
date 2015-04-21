class Address < ActiveRecord::Base
	validates :postal_code, length: {is: 7}, allow_blank: true
	belongs_to :customer
end
