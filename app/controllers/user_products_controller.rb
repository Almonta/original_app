class UserProductsController < ApplicationController
  def create
    user_product = current_user.user_products.create(product_id: params[:product_id])
    # binding.pry
    redirect_to homes_path, notice: "#{user_product.product.name}を「★登録プロジェクト」に登録しました"
  end

  def destroy
    user_product = current_user.user_products.find_by(id: params[:id]).destroy
    redirect_to homes_path, notice: "#{user_product.product.name}を「★登録プロジェクト」から解除しました"
  end
end
