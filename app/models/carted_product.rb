class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :user

  validates :quantity, numericality: {greater_than: 0, only_integer: true}
end
