class SchedulesController < ApplicationController
  before_action :set_customer, only: %i[ create edit update ]
  def create
    @schedule = @customer.schedules.build(schedule_params)
    respond_to do |format|
      if @schedule.save
        # format.html { redirect_to customer_path(@customer) }
        format.js { render :index }
      else
        format.html { redirect_to customer_path(@customer), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.name == 'ゲスト')
    @schedule = @customer.schedules.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.name == 'ゲスト')
    @schedule = @customer.schedules.find(params[:id])
    respond_to do |format|
      if @schedule.update(schedule_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if (current_user.department == 'planning') || (current_user.name == 'ゲスト')
      @schedule.destroy
    else
      return redirect_to customer_path(@customer.id)
    end
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:customer_id, :serial_number, :line_on, :completed_on, :shipmented_on, :deliveried_on)
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

end
