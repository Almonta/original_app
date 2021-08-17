class ProductContactsController < ApplicationController
  before_action :set_product, only: %i[create edit update]
  def create
    # raise
    # @product = Product.find(params[:product_id])
    @product_contact = @product.product_contacts.build(product_contact_params)
    # binding.irb
    respond_to do |format|
      if @product_contact.save
        format.js { render :index }
        # binding.irb
      else
        # format.html { render products/show }
        format.html { redirect_to product_path(@product), notice: '空メッセージは投稿出来ません。' }
      end
    end
  end

  def edit
    # binding.pry
    @product_contact = @product.product_contacts.find(params[:id])
    redirect_to product_path(@product) unless (current_user == @product_contact.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    respond_to do |format|
      flash.now[:notice] = 'メッセージの編集中...'
      format.js { render :edit }
    end
  end

  def update
    @product_contact = @product.product_contacts.find(params[:id])
    redirect_to product_path(@product) unless (current_user == @product_contact.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    respond_to do |format|
      if @product_contact.update(product_contact_params)
        flash.now[:notice] = 'メッセージが編集されました。'
        format.js { render :index }
      else
        flash.now[:notice] = 'メッセージの編集に失敗しました。'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @product_contact = ProductContact.find(params[:id])
    redirect_to product_path(@product) unless (current_user == @product_contact.user) || (current_user.name == "ゲスト") || (current_user.name == "ゲスト管理者")
    @product_contact.destroy
    respond_to do |format|
      flash.now[:notice] = 'メッセージが削除されました。'
      format.js { render :index }
    end
  end

  private

  def product_contact_params
    params.require(:product_contact).permit(:product_id, :user_id, :contact_message).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
