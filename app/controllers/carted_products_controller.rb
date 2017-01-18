class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id)
    if current_user
      render 'index.html.erb'
    else
      flash[:warning] = 'You are not logged in'
      redirect_to '/login'
    end  
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: 'carted'
      )
    carted_product.save
    redirect_to '/carted_products'
  end
end
