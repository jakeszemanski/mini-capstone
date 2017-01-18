class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  def index
   only_show_discount = params[:discount] == "true"
    if only_show_discount 
      @products = Product.where('price < ?', 2)
    elsif params[:category_name]
      selected_category = Category.find_by(name: params[:category_name])
      @products = selected_category.products
    else
      sort_attribute = params[:sort] || "name"
      sort_order = params[:sort_order] || "asc"
      @products = Product.order(sort_attribute => :asc)
    end
    render 'index.html.erb'
  end

  def new
    @product = Product.new
    render 'new.html.erb'  
  end

  def create
    @product = Product.new(
        name: params['name'],
        price: params['price'],
        description: params['description'],
        supplier_id: 1
        )
    if @product.save
      image = Image.new(
          name: params[:image],
          product_id: @product.id)
      image.save
      flash[:success] = "Product created!"
      redirect_to '/products/'
      else
        flash[:warning] = "Product did not save"
        render 'new.html.erb'
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
      @product = Product.find_by(id: params[:id])
      render 'edit.html.erb'
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    if @product.save
      flash[:success] = "Product saved"
      redirect_to "/products/#{@product.id}"
    else
      render 'edit.html.erb'
    end
  end

  def destroy
      product = Product.find_by(id: params[:id])
      product.destroy
      redirect_to '/products'
  end
end
