class Province < ActiveRecord::Base
	def gst_rate # getter
	   read_attribute(:gst_rate).to_f / 100
	end

	def gst_rate=(value) #  setter
	  write_attribute(:gst_rate, (value * 100).to_i)
	end

	def hst_rate # getter
	   read_attribute(:hst_rate).to_f / 100
	end

	def hst_rate=(value) #  setter
	  write_attribute(:hst_rate, (value * 100).to_i)
	end

	def pst_rate # getter
	   read_attribute(:pst_rate).to_f / 100
	end

	def pst_rate=(value) #  setter
	  write_attribute(:pst_rate, (value * 100).to_i)
	end
	
	validates :short_name, length: {is: 2}, allow_blank: true
	has_many :customers
end
