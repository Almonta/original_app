class ProductDocumentsController < ApplicationController
  before_action :set_product_document, only: %i[show edit update destroy]

  def index
    # @product_documents = ProductDocument.all
    @product = Product.where(id: params[:product_id]).first
    # .firstを無しにする
    # @product = Product.where(id: params[:product_id])
    # find_byでやってみる
    # @product = Product.find_by(id: params[:product_id])
    @product_documents = @product.product_documents.all
  end

  def show; end

  def new
    # @product_document = ProductDocument.new
    @product = Product.where(id: params[:product_id]).first
    @product_document = @product.product_documents.build
  end

  def edit; end

  def create
    # @product_document = ProductDocument.new(product_document_params)
    @product = Product.where(id: params[:product_id]).first
    @product_document = @product.product_documents.build(product_document_params)
    @product_document.user_id = current_user.id

    respond_to do |format|
      if @product_document.save
        format.html { redirect_to [@product, @product_document], notice: "Product document was successfully created." }
        format.json { render :show, status: :created, location: @product_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_document.update(product_document_params)
        # format.html { redirect_to @product, notice: "Product document was successfully updated." }
        format.html { redirect_to [@product, @product_document], notice: "Product document was successfully updated." }
        format.json { render :show, status: :ok, location: @product_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_document.destroy
    respond_to do |format|
      # format.html { redirect_to product_documents_url, notice: "Product document was successfully destroyed." }
      format.html { redirect_to product_product_documents_url, notice: "Product document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product_document
    # @product_document = ProductDocument.find(params[:id])
    @product = Product.where(id: params[:product_id]).first
    # binding.pry
    @product_document = @product.product_documents.where(id: params[:id]).first
  end

  def product_document_params
    params.require(:product_document).permit(:user_id, :product_id, :name, :content, :public_level)
  end
end
