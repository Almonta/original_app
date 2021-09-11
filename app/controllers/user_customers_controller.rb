class UserCustomersController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    current_user.customer_registered(@customer)
  end

  def destroy
    @customer = current_user.registered_customers.find(params[:id])
    current_user.customer_unregistered(@customer)
  end
end
