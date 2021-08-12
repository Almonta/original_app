class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @customers = Customer.all
  end

  def show
    @user_customer = current_user.user_customers.find_by(customer_id: @customer.id)
    @customer_contacts = @customer.customer_contacts
    @customer_contact = @customer.customer_contacts.build
    @user_customers = @customer.user_customers
    @schedules = @customer.schedules.order(created_at: :desc)
    @schedule = @customer.schedules.build
  end

  def new
    @customer = Customer.new
  end

  def edit
    redirect_to homes_path unless current_user == @customer.user
  end

  def create
    @customer = current_user.customers.build(customer_params)

    # if @customer.number =~ /^[0-9]+$/
      respond_to do |format|
        if @customer.save
          format.html { redirect_to @customer, notice: t('views.messages.create_customer') }
          # format.json { render :show, status: :created, location: @customer }
        else
          format.html { render :new, status: :unprocessable_entity }
          # format.json { render json: @customer.errors, status: :unprocessable_entity }
        end
      end
    # else
      # flash.now[:alert] = t('views.messages.check_number')
      # render :new
    # end
  end

  def update
    redirect_to homes_path unless current_user == @customer.user
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: t('views.messages.update_customer') }
        # format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return redirect_to homes_path unless current_user == @customer.user

    @customer.destroy
    respond_to do |format|
      format.html { redirect_to homes_path, alert: t('views.messages.destroy_customer') }
      # format.json { head :no_content }
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:number, :name)
    end
end
