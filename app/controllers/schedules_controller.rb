class SchedulesController < ApplicationController
  before_action :set_customer, only: %i[create edit update]
  def create
    # binding.pry
    @schedule = @customer.schedules.build(schedule_params)
    respond_to do |format|
      if @schedule.save
        # format.html { redirect_to customer_path(@customer) }
        # binding.pry
        format.js { render :index }
      else
        # format.js { render :error }
        # error_messages = @schedule.errors.full_messages
        # format.js { message :error_messages }
        # format.html { redirect_to customer_path(@customer, @schedule) }
        
      # if @schedule.serial_number.new_record?
        # binding.irb
        format.html { redirect_to customer_path(@customer), notice: '投稿できませんでした...' }
        # if @schedule.serial_number.blank?

          # flash[:notice] = '製品番号が空欄です。'
          # format.html { redirect_to customer_path(@customer)}
          # binding.irb
        # elsif @schedule.serial_number.length > 255
        #   format.html { redirect_to customer_path(@customer), notice: '製品番号は255文字以内で入力してください。'}
        # elsif Schedule.where(serial_number: @schedule.serial_number).present?
        #   format.html { redirect_to customer_path(@customer), notice: '製品番号が重複しています。' }
        # # elsif @schedule.serial_number =~ /^\A[a-z0-9[-]]+\z/
        #   # format.html { redirect_to customer_path(@customer), notice: '製品番号は半角英数字で入力してください' }
        # else
        #   format.html { redirect_to customer_path(@customer)}
      #   elsif @schedule.line_on.present? || @schedule.conpleted_on.present? || @schedule.shipmented_on.present? || @schedule.deliveried_on.present?
      # # if @schedule.serial_number.valid?
        # binding.irb
        # elsif @schedule.line_on > @schedule.completed_on
        #   format.html { redirect_to customer_path(@customer), notice: '生産完了日がおかしい。' }
        # elsif (@schedule.line_on > @schedule.shipmented_on) || (@schedule.completed_on > @schedule.shipmented_on)
        #   format.html { redirect_to customer_path(@customer), notice: '出荷日がおかしい。' }
        # elsif (@schedule.line_on > @schedule.deliveried_on) || (@schedule.completed_on > @schedule.deliveried_on) || (@schedule.shipmented_on > @schedule.deliveried_on)
        #   format.html { redirect_to customer_path(@customer), notice: '納品日のがおかしい。' }
          # binding.irb
        # end
        # format.html { redirect_to customer_path(@customer) , flash: message }
        # format.html { redirect_to customer_path(@customer) }
        # end

        # case
        # when @schedule.line_on > @schedule.completed_on
        #   flash.now[:notice] = "着手日が完了日より先の日付が設定されました。間違いがないか確認してください。"
        #   format.js { render :index }
        # when @schedule.line_on > @schedule.shipmented_on
        #   flash.now[:notice] = "着手日が出荷日より先の日付が設定されました。間違いがないか確認してください。"
        #   format.js { render :index }
        # when @schedule.line_on > @schedule.deliveried_on
        #   flash.now[:notice] = "着手日が納品日より先の日付が設定されました。間違いがないか確認してください。"
        #   format.js { render :index }
        # when @schedule.completed_on > @schedule.shipmented_on
        #   flash.now[:notice] = "完了日が出荷日より先の日付が設定されました。間違いがないか確認してください。"
        #   format.js { render :index }
        # when @schedule.completed_on > @schedule.deliveried_on
        #   flash.now[:notice] = "完了日が納品日より先の日付が設定されました。間違いがないか確認してください。"
        #   format.js { render :index }
        # when @schedule.shipmented_on > @schedule.deliveried_on
        #   flash.now[:notice] = "出荷日が納品日より先の日付が設定されました。間違いがないか確認してください。"
        #   format.js { render :index }
        # end
      end
    end
  end

  def edit
    redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.name == "ゲスト") || (current_user.name == "管理者")
    @schedule = @customer.schedules.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'スケジュールの編集中...'
      format.js { render :edit }
    end
  end

  def update
    redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.name == "ゲスト") || (current_user.name == "管理者")
    @schedule = @customer.schedules.find(params[:id])
    respond_to do |format|
      if @schedule.update(schedule_params)
        flash.now[:notice] = 'スケジュールが編集されました。'
        format.js { render :index }
      else
        flash.now[:notice] = 'スケジュールの編集に失敗しました。'
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    return redirect_to customer_path(@customer.id) unless (current_user.department == 'planning') || (current_user.name == "ゲスト") || (current_user.name == "管理者")

    @schedule.destroy
    respond_to do |format|
      flash.now[:notice] = 'スケジュールが削除されました。'
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
