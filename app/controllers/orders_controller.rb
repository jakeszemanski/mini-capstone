class OrdersController < ApplicationController
  def create 
    carted_products = current_user.carted_products.where(status: "carted")

    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
      puts subtotal
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    
    order.save

    last_order = Order.last

    carted_products.each do |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = last_order.id
      carted_product.save
    end

    flash[:success] = "Your order was successfully created!"
    redirect_to "/orders/#{current_user.orders.last.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end

end
