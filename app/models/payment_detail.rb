class PaymentDetail < ActiveRecord::Base
	validates :card_number_string, length: {is: 16}, allow_blank: true
	belongs_to :customer
end
