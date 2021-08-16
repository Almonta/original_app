class ProductDocumentsController < ApplicationController
  before_action :set_product_document, only: %i[show edit update destroy]

  def index
    @product = Product.where(id: params[:product_id]).first
    @product_documents = @product.product_documents.all
    if params[:general]
      @documents = @product_documents.where(public_level: 0)
    elsif params[:technical]
      @documents = @product_documents.where(public_level: 1)
    end
  end

  def show
    # binding.pry
  end

  def new
    @product = Product.where(id: params[:product_id]).first
    @product_document = @product.product_documents.build
  end

  def edit
    redirect_to product_path(@product.id) unless (current_user == @product_document.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
  end

  def create
    @product = Product.where(id: params[:product_id]).first
    @product_document = @product.product_documents.build(product_document_params)
    @product_document.user_id = current_user.id

    respond_to do |format|
      if @product_document.save
        format.html { redirect_to [@product, @product_document], notice: t('views.messages.create_product_document') }
        format.json { render :show, status: :created, location: @product_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    redirect_to product_path(@product.id) unless (current_user == @product_document.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    respond_to do |format|
      if @product_document.update(product_document_params)
        format.html { redirect_to [@product, @product_document], notice: t('views.messages.update_product_document') }
        format.json { render :show, status: :ok, location: @product_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return redirect_to product_path(@product.id) unless (current_user == @product_document.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")

    @product_document.destroy
    respond_to do |format|
      case @product_document.public_level
      when 0
        format.html { redirect_to product_product_documents_path(general: "true"), notice: t('views.messages.destroy_product_document') }
        format.json { head :no_content }
      when 1
        format.html { redirect_to product_product_documents_path(technical: "true"), notice: t('views.messages.destroy_product_document') }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_product_document
    @product = Product.where(id: params[:product_id]).first
    @product_document = @product.product_documents.where(id: params[:id]).first
  end

  def product_document_params
    params.require(:product_document).permit(:user_id, :product_id, :name, :content, :public_level, :document, :document_cache)
  end
end
