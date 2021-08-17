require 'rails_helper'

RSpec.describe ProductContact, type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product, user: user) }
  let!(:second_product) { FactoryBot.create(:second_product, user: user) }
  let!(:third_product) { FactoryBot.create(:third_product, user: user) }

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
        fill_in 'product_contact_contact_message', with: 'テストメッセージ'
        binding.irb
        find(:xpath, '/html/body/div/div[2]/div[2]/div[2]/form/div[2]/span[2]/button').click
        # /html/body/div/div[2]/div[2]/form/div/span[2]/button
        expect(page).to have_content 'テストメッセージ'
      end
    end
  end
end
