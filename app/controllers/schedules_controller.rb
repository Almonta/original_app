class SchedulesController < ApplicationController
  before_action :set_customer, only: %i[create edit update]
  def create
    @schedule = @customer.schedules.build(schedule_params)
    respond_to do |format|
      if @schedule.save
        # format.html { redirect_to customer_path(@customer) }
        # binding.pry
        format.js { render :index }
      else
        # if @schedule.serial_number.new_record?
          # binding.irb
          # format.html { redirect_to customer_path(@customer), notice: '投稿できませんでした...' }
          if @schedule.serial_number.blank?
            format.html { redirect_to customer_path(@customer), notice: '製品番号が空欄です。' }
          elsif @schedule.serial_number.length > 255
            format.html { redirect_to customer_path(@customer), notice: '製品番号は255文字以内で入力してください。'}
          elsif Schedule.where(serial_number: @schedule.serial_number).present?
            format.html { redirect_to customer_path(@customer), notice: '製品番号が重複しています。' }
          # elsif
        #   elsif @schedule.line_on.present? || @schedule.conpleted_on.present? || @schedule.shipmented_on.present? || @schedule.deliveried_on.present?
        # # if @schedule.serial_number.valid?
          # binding.irb
          elsif @schedule.line_on > @schedule.completed_on
            format.html { redirect_to customer_path(@customer), notice: '生産着手日と生産完了日の日付が前後しています。' }
          elsif (@schedule.line_on > @schedule.shipmented_on) || (@schedule.completed_on > @schedule.shipmented_on)
            format.html { redirect_to customer_path(@customer), notice: '生産着手日と生産完了日の日付がおかしい。' }
          elsif (@schedule.line_on > @schedule.deliveried_on) || (@schedule.completed_on > @schedule.deliveried_on) || (@schedule.shipmented_on > @schedule.deliveried_on)
            format.html { redirect_to customer_path(@customer), notice: '生産着手日と生産完了日の日付がおかしいって。' }
            # binding.irb
          # end
          # format.html { redirect_to customer_path(@customer) , flash: message }
          # format.html { redirect_to customer_path(@customer) }
          end
      end
    end
  end

  def edit
    redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.id == 1) || (current_user.id ==2)
    @schedule = @customer.schedules.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.id == 1) || (current_user.id ==2)
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
    return redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.id == 1) || (current_user.id ==2)

    @schedule.destroy
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
