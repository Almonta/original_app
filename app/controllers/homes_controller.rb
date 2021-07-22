class HomesController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    # @products = Product.all
    @customers = Customer.all
  end

  # def search
  #   @q = Product.ransack(params[:q])
  #   @results = @q.result
  # end

end
