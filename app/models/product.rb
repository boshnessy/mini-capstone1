class Product < ApplicationRecord
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products
  belongs_to :supplier
  has_many :orders
  has_many :images

  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :name, length: { maximum: 100 }
  validates :description, length: { in: 10..500 }

  def as_json
    {
      id: id,
      name: name,
      price: price,
      tax: tax,
      total: total,
      discount: is_discounted?,
      description: description,
      in_stock: in_stock,
      supplier: supplier.as_json,
      images: images[0],
      categories: categories.as_json
    }
  end 

  def is_discounted?
    price < 2
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    price + tax
  end

end