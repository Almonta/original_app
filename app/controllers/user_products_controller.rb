class UserProductsController < ApplicationController
  def create
    user_product = current_user.user_products.create(product_id: params[:product_id])
    redirect_to homes_path, notice: "#{user_product.product.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    user_product = current_user.user_products.find_by(id: params[:id]).destroy
    redirect_to homes_path, notice: "#{user_product.product.user.name}さんのブログをお気に入り解除しました"
  end
end
