class AddProductIdToCartedProducts < ActiveRecord::Migration
  def change
    add_column :carted_products, :product_id, :integer 
  end
end
