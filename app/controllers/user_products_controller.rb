class UserProductsController < ApplicationController
  # def index
  #   @user_products = UserProduct.all
  #   binding.irb
  # end

  def create
    # binding.pry
    # @product = Product.find(params[:product_id])
    user_product = current_user.user_products.create(product_id: params[:product_id])
    # binding.pry
    # user_product.save
    redirect_to registered_projects_path, notice: "#{user_product.product.name}を「★登録プロジェクト」に登録しました"
    # redirect_to product_path(@product), notice: "#{user_product.product.name}を「★登録プロジェクト」に登録しました"
  end

  def destroy
    # @product = Product.find(params[:product_id])
    user_product = current_user.user_products.find_by(id: params[:id]).destroy
    # user_product.destroy
    redirect_to homes_path, notice: "#{user_product.product.name}を「★登録プロジェクト」から解除しました"
    # redirect_to product_path(@product), notice: "#{user_product.product.name}を「★登録プロジェクト」から解除しました"
  end
end

# def create
#   @product = Product.find(params[:product_id])
#   register = current_user.user_products.build(product_id: params[:product_id])
#   register.save
# end

# def destroy
#   @product = Product.find(params[:product_id])
#   register = UserProduct.find_by(product_id: params[:blog_id], user_id: current_user.id)
#   register.destroy
# end
