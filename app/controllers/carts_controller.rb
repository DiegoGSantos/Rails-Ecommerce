class CartsController < ApplicationController
  before_action :authenticate_user!
 
  def checkout
    unless current_user.customer_id.nil?
      @customer = Customer.find(current_user.customer_id)
      unless Address.where(customer: @customer)[0].nil?
        @address = Address.where(customer: @customer)[0]
      else
        @address = Address.new
      end
      unless PaymentDetail.where(customer: @customer)[0].nil?
        @payment_detail = PaymentDetail.where(customer: @customer)[0]
      else
        @payment_detail = PaymentDetail.new
      end
    else
      @customer = Customer.new
      @address = Address.new
      @payment_detail = PaymentDetail.new
    end
  end

  def payment
    @payment_detail = PaymentDetail.new
  end

  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
  end
 
  def add
      $redis.sadd current_user_cart, params[:product_id]
      redirect_to cart_path
  end
 
  def remove
    $redis.srem current_user_cart, params[:product_id]
    redirect_to cart_path
  end
 
  private
 
  def current_user_cart
    "cart#{current_user.id}"
  end
end
