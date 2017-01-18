class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products

  validates :name, presence: true
  validates :name, length: {minimum: 2}
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0, less_than: 1000 }
  validates :description, presence: true
  def sale_message
    if price.to_i <= 2.0
      "Discount Item!"
    else
      "Everyday Value!"
    end
  end

  def tax
    tax = price.to_i * 0.09
    tax
  end

  def total
    total = price.to_i + tax
    total
  end

end
