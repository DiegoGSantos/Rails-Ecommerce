class Product < ActiveRecord::Base
	def price # getter
	   read_attribute(:price).to_f / 100
	end

	def price=(value) #  setter
	  write_attribute(:price, (value * 100).to_i)
	end

	belongs_to :category
end
