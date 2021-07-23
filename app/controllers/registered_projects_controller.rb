class RegisteredProjectsController < ApplicationController
  def index
    @products = current_user.registered_products
    @products = @products.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @q = current_user.registered_customers.ransack(params[:q])
    @customers = @q.result(distinct: true)
  end
end
