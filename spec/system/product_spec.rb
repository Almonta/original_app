require 'rails_helper'

RSpec.describe Product, type: :system do
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

  describe '新規作成機能' do
    context 'プロダクトを新規作成した場合' do
      it '詳細画面に遷移し作成したプロダクトが表示される' do
        user_login
        click_button 'プロダクト新規登録'
        fill_in 'product_name', with: 'product1'
        click_button '登録する'
        expect(page).to have_content 'product1'
      end
    end
  end
end