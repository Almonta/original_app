class UserProductsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    current_user.registered(@product)
  end

  def destroy
    @product = current_user.registered_products.find(params[:id])
    current_user.unregistered(@product)
  end
end