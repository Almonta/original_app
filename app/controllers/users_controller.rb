class UsersController < ApplicationController
  def show
    @user = current_user
    @products = Product.where(user_id: current_user.id)
    @customers = Customer.where(user_id: current_user.id)
    # binding.irb
  end
end
