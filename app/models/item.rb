class Item < ActiveRecord::Base
	def price=(value) #  setter
	  write_attribute(:price, ((value.to_f * self.quantity)* 100).to_i)
	end
	belongs_to :product
	belongs_to :order
end
