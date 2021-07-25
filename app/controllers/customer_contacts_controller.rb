class CustomerContactsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @customer_contact = @customer.customer_contacts.build(customer_contact_params)
    respond_to do |format|
      if @customer_contact.save
        # format.html { redirect_to customer_path(@customer) }
        format.js { render :index }
      else
        format.html { redirect_to customer_path(@customer), notice: '投稿できませんでした' }
      end
    end
  end
  
  private

  def customer_contact_params
    params.require(:customer_contact).permit(:customer_id, :contact_message).merge(user_id: current_user.id)
  end
end
