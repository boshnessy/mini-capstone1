class V4::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    search_term = params[:search]
    sort_by_price = params[:sort_price]

    if sort_by_price == 'true'
      products = Product.all.order(:price).where("price > ?", "#{search_term}")
    else
      products = Product.all.order(:id).where("name LIKE ?", "%#{search_term}%")
    end

    render json: products.as_json
  end

  def show
    id = params[:id]
    products = Product.find_by(id: id)
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      in_stock: params[:input_in_stock],
      supplier_id: params[:input_supplier_id]
    )
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessible_entity
    end
  end

  def update
    id = params[:id]
    product = Product.find_by(id: id)
    if product.update(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description],
      in_stock: params[:input_in_stock]
    )
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessible_entity
    end
  end

end