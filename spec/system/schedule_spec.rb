require 'rails_helper'

RSpec.describe Schedule, type: :system do
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:customer) { FactoryBot.create(:customer, user: second_user) }
  let!(:second_customer) { FactoryBot.create(:second_customer, user: second_user) }
  let!(:third_customer) { FactoryBot.create(:third_customer, user: second_user) }

  def user_login
    visit new_user_session_path
    fill_in 'user_email', with: 'user2@sample.com'
    fill_in 'user_password', with: 'pass2222'
    click_button 'ログイン'
  end

  describe 'スケジュール新規作成機能' do
    context 'スケジュールを新規作成した場合' do
      it '作成したスケジュールが表示される' do
        user_login
        first(:link, '詳細').click
        fill_in 'schedule_serial_number', with: '12345'
        fill_in 'schedule_line_on', with: "002021-08-10"
        fill_in 'schedule_completed_on', with: '002021-08-20'
        fill_in 'schedule_shipmented_on', with: '002021-08-30'
        fill_in 'schedule_deliveried_on', with: '002021-08-31'
        click_button '登録する'
        # binding.irb
        # find(:xpath, '/html/body/div/div[2]/div[2]/form/table/thead/tr/th[6]/div/input').click
        # /html/body/div/div[2]/div[1]/form/table/thead/tr/th[6]/div/input
        # /html/body/div/div[2]/form/div/div[6]/div/input
        # binding.irb
        expect(page).to have_content '12345'
      end
    end
  end
end
