class V4::CartedProductsController < ApplicationController
  def index
    carted_products = CartedProduct.all
    
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products.as_json
  end

  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    if carted_product.save
      render json: carted_product.as_json
    else
      render json: {errors: carted_product.errors.full_messages}, status: :unprocessible_entity
    end
  end
end