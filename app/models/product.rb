class Product < ActiveRecord::Base
	def price # getter
	   read_attribute(:price).to_f / 100
	end

	def price=(value) #  setter
	  write_attribute(:price, (value * 100).to_i)
	end

	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
	belongs_to :category
end
