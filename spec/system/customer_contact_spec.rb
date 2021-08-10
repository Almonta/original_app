require 'rails_helper'

RSpec.describe CustomerContact, type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer, user: user) }
  let!(:second_customer) { FactoryBot.create(:second_customer, user: user) }
  let!(:third_customer) { FactoryBot.create(:third_customer, user: user) }

  def user_login
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@sample.com'
    fill_in 'user_password', with: 'pass1111'
    click_button 'ログイン'
  end

  describe 'メッセージ新規投稿機能' do
    context 'メッセージを新規投稿した場合' do
      it '作成したメッセージが表示される' do
        user_login
        first(:link, '詳細').click
        fill_in 'customer_contact_contact_message', with: 'テストメッセージ'
        # binding.irb
        # find(:xpath, '/html/body/div/div[2]/div[2]/form/span[2]/button/i').click
        click_button '登録する'
        expect(page).to have_content 'テストメッセージ'
      end
    end
  end
end