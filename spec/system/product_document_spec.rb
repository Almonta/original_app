require 'rails_helper'

RSpec.describe ProductDocument, type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product, user: user) }
  let!(:second_product) { FactoryBot.create(:second_product, user: user) }
  let!(:third_product) { FactoryBot.create(:third_product, user: user) }
  let!(:product_document) { FactoryBot.create(:product_document, user: user, product: product) }
  let!(:second_product_document) { FactoryBot.create(:second_product_document, user: user, product: second_product) }
  let!(:third_product_document) { FactoryBot.create(:third_product_document, user: user, product: product) }
  let!(:fourth_product_document) { FactoryBot.create(:fourth_product_document, user: user, product: second_product) }

  def user_login
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@sample.com'
    fill_in 'user_password', with: 'pass1111'
    click_button 'ログイン'
  end

  describe '新規作成機能' do
    context 'プロダクト資料を新規作成した場合' do
      it '詳細画面に遷移し作成したプロダクト資料が表示される' do
        user_login
        # first(:link, '詳細').click
        find(:xpath, '/html/body/div/div/div/div[1]/div[2]/div[1]/a/div').click
        find(".general_document_button").click
        click_button 'プロダクト資料新規登録'
        fill_in 'product_document_name', with: 'product_document1'
        fill_in 'product_document_content', with: 'product_document1_content'
        choose 'product_document_public_level_0'
        attach_file 'product_document_document', "#{Rails.root}/spec/factories/RSpec_test.jpg"
        click_button '登録する'
        # binding.irb
        expect(page).to have_content 'product_document1'
        expect(page).to have_content 'product_document1_content'
        expect(page).to have_content '一般'
      end
    end
  end

  describe '一覧表示機能' do
    context 'product1の詳細画面から一般資料一覧画面に遷移した場合' do
      it 'product1の持つ一般資料のみが表示される' do
        user_login
        # first(:link, '詳細').click
        find(:xpath, '/html/body/div/div/div/div[1]/div[2]/div[1]/a/div').click
        find(".general_document_button").click
        # binding.irb
        expect(page).to have_content 'product_document1'
      end
    end
  end
end
