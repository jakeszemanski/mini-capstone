class ProductsController < ApplicationController
  def home_method
    @products = Product.all
    render 'home_page.html.erb'
  end
end
