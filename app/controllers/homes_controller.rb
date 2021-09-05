class HomesController < ApplicationController
  def index
    @product = Product.new
    @customer = Customer.new
    @products = Product.all
    # @products = Product.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?
    @products = Product.search_product(params[:search]) if params[:search].present?
    @q = Customer.ransack(params[:q])
    @customers = @q.result(distinct: true).order(number: :asc)
    # @q = Customer.ransack
  end
end
