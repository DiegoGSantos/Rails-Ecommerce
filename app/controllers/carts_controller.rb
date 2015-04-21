class CartsController < ApplicationController
  before_action :authenticate_user!
 
  def checkout
    @provinces = Province.all
    unless Customer.find(current_user.id).nil?
      @customer = Customer.find(current_user.customer_id)
      unless Address.where(customer: @customer)[0].nil?
        @address = Address.where(customer: @customer)[0]
      else
        @address = Address.new
        @address.customer_id = current_user.id
        @address.save
      end
      unless PaymentDetail.where(customer: @customer)[0].nil?
        @payment_detail = PaymentDetail.where(customer: @customer)[0]
      else
        @payment_detail = PaymentDetail.new
        @payment_detail.customer_id = current_user.id
        @payment_detail.save
      end
    else
      @customer = Customer.new
      @address = Address.new
      @address.customer_id = current_user.id
      @address.save
      @payment_detail = PaymentDetail.new
      @payment_detail.customer_id = current_user.id
      @payment_detail.save
    end
  end

  def payment
    @payment_detail = PaymentDetail.new
  end

  def show
    cart_ids = $redis.hkeys current_user_cart
    # cart_ids = $redis.hget(current_user_cart, "9")
    @cart_products = Product.find(cart_ids)
  end
 
  def add
      # $redis.sadd current_user_cart, params[:product_id]
      # redirect_to cart_path

      $redis.hmset(current_user_cart, params[:product_id], 1)

      # $redis.hmset(current_user_cart, :id, ":product_id.to_s", :qty, "1")

      # $redis.hmset current_user_cart id :product_id qty "1" 
      redirect_to cart_path
      #HMSET myhash field1 "Hello" field2 "World"

  end
 
  def remove
    # $redis.srem current_user_cart, params[:product_id]
    $redis.hdel current_user_cart, params[:product_id]
    redirect_to cart_path
  end

  def create_order
    @customer = Customer.find(current_user.customer_id)
    @province = @customer.province

    @order = Order.new
    @order.status = "New"
    @order.customer = @customer
    @order.pst_rate = @province.pst_rate
    @order.gst_rate = @province.gst_rate
    @order.hst_rate = @province.hst_rate

    @order.save

    cart_ids = $redis.hkeys current_user_cart
    @cart_products = Product.find(cart_ids)

    @cart_products.each do |product|
      @item = Item.new

      @item.order = @order
      @item.product_id = product.id
      @item.quantity = $redis.hget(current_user_cart, product.id)
      @item.price = product.price

      @item.save
      @customer.save

    end
  end
 
  private
 
  def current_user_cart
    "cart#{current_user.id}"
  end
end
