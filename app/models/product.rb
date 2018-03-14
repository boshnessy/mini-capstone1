class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :name, length: { maximum: 30 }
  validates :description, length: { in: 10..500 }

  def as_json
    {
      id: id,
      name: name,
      price: price,
      tax: tax,
      total: total,
      discount: is_discounted?,
      image: image_url,
      description: description,
      in_stock: in_stock
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