class AddSupplierId < ActiveRecord::Migration
  def change
    add_column :products, :supplier_id, :string
  end
end
