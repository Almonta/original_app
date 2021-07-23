class UserCustomersController < ApplicationController
  def create
    user_customer = current_user.user_customers.create(customer_id: params[:customer_id])
    # binding.pry
    redirect_to homes_path, notice: "#{user_customer.customer.name}を「★登録プロジェクト」に登録しました"
  end
  def destroy
    user_customer = current_user.user_customers.find_by(id: params[:id]).destroy
    redirect_to homes_path, notice: "#{user_customer.customer.name}を「★登録プロジェクト」から解除しました"
  end
end
