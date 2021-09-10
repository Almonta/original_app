class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    # @q = Product.ransack(params[:q])
    # @products = Product.all
  end

  def show
    # @user_product = current_user.user_products.find_by(product_id: @product.id)
    @product_contacts = @product.product_contacts
    @product_contact = @product.product_contacts.build
    @user_products = @product.user_products
  end

  # モーダルへの変更につき実際不要
  def new
    @product = Product.new
  end

  def edit
    redirect_to homes_path unless (current_user == @product.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
  end

  def create
    @product = current_user.products.build(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: t('views.messages.create_product') }
      else
        format.js { render :error }
      end
    end
  end

  def update
    redirect_to homes_path unless (current_user == @product.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: t('views.messages.update_product') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return redirect_to homes_path unless (current_user == @product.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")

    @product.destroy
    respond_to do |format|
      format.html { redirect_to homes_path, alert: t('views.messages.destroy_product') }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name)
    end
end
