class CustomerDocumentsController < ApplicationController
  before_action :set_customer_document, only: %i[ show edit update destroy ]

  # GET /customer_documents or /customer_documents.json
  def index
    @customer_documents = CustomerDocument.all
  end

  # GET /customer_documents/1 or /customer_documents/1.json
  def show
  end

  # GET /customer_documents/new
  def new
    @customer_document = CustomerDocument.new
  end

  # GET /customer_documents/1/edit
  def edit
  end

  # POST /customer_documents or /customer_documents.json
  def create
    @customer_document = CustomerDocument.new(customer_document_params)

    respond_to do |format|
      if @customer_document.save
        format.html { redirect_to @customer_document, notice: "Customer document was successfully created." }
        format.json { render :show, status: :created, location: @customer_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_documents/1 or /customer_documents/1.json
  def update
    respond_to do |format|
      if @customer_document.update(customer_document_params)
        format.html { redirect_to @customer_document, notice: "Customer document was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_documents/1 or /customer_documents/1.json
  def destroy
    @customer_document.destroy
    respond_to do |format|
      format.html { redirect_to customer_documents_url, notice: "Customer document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_document
      @customer_document = CustomerDocument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_document_params
      params.require(:customer_document).permit(:name, :content, :public_level, :user_id, :customer_id)
    end
end
