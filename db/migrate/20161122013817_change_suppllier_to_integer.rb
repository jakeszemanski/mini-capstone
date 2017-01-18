class ChangeSuppllierToInteger < ActiveRecord::Migration
  def change
    remove_column :products, :supplier_id, :string
  end
end
