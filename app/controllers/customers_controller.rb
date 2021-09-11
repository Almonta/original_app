class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  def index
    # @customers = Customer.all
  end

  def show
    @customer_contacts = @customer.customer_contacts
    @customer_contact = @customer.customer_contacts.build
    @user_customers = @customer.user_customers
    @schedules = @customer.schedules.page(params[:page]).per(4).order(created_at: :desc)
    @schedule = @customer.schedules.build
  end

  # モーダルへの変更につき実際不要
  def new
    @customer = Customer.new
  end

  def edit
    redirect_to homes_path unless (current_user == @customer.user) || (current_user.name == "ゲスト") || (current_user.name == "管理者")
  end

  def create
    @customer = current_user.customers.build(customer_params)

      # if @customer.number =~ /^[0-9]+$/
      respond_to do |format|
        if @customer.save
          format.html { redirect_to @customer, notice: t('views.messages.create_customer') }
        else
          format.js { render :error }
        end
      end
    # else
    # flash.now[:alert] = t('views.messages.check_number')
    # render :new
    # end
  end

  def update
    redirect_to homes_path unless (current_user == @customer.user) || (current_user.name == "ゲスト") || (current_user.name == "管理者")
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: t('views.messages.update_customer') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return redirect_to homes_path unless (current_user == @customer.user) || (current_user.name == "ゲスト") || (current_user.name == "管理者")

    @customer.destroy
    respond_to do |format|
      format.html { redirect_to homes_path, alert: t('views.messages.destroy_customer') }
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:number, :name, :address)
    end
end
