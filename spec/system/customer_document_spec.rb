require 'rails_helper'

RSpec.describe ProductDocument, type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer, user: user) }
  let!(:second_customer) { FactoryBot.create(:second_customer, user: user) }
  let!(:third_customer) { FactoryBot.create(:third_customer, user: user) }
  let!(:customer_document) { FactoryBot.create(:customer_document, user: user, customer: customer) }
  let!(:second_customer_document) { FactoryBot.create(:second_customer_document, user: user, customer: second_customer) }
  let!(:third_customer_document) { FactoryBot.create(:third_customer_document, user: user, customer: customer) }
  let!(:fourth_customer_document) { FactoryBot.create(:fourth_customer_document, user: user, customer: second_customer) }

  def user_login
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@sample.com'
    fill_in 'user_password', with: 'pass1111'
    click_button 'ログイン'
  end

  describe '新規作成機能' do
    context 'カスタマー資料を新規作成した場合' do
      it '詳細画面に遷移し作成したカスタマー資料が表示される' do
        user_login
        # first(:link, '詳細').click
        find(:xpath, '/html/body/div/div/div/div[2]/div[2]/div[1]/a/div').click
        find(".general_document_button").click
        # binding.irb
        click_button 'カスタマー資料新規登録'
        fill_in 'customer_document_name', with: 'customer_document1'
        fill_in 'customer_document_content', with: 'customer_document_content1'
        choose 'customer_document_public_level_0'
        attach_file 'customer_document_document', "#{Rails.root}/spec/factories/RSpec_test.jpg"
        click_button '登録する'
        expect(page).to have_content 'customer_document1'
        expect(page).to have_content 'customer_document_content1'
        expect(page).to have_content '一般'
      end
    end
  end

  describe '一覧表示機能' do
    context 'customer1の詳細画面から一般資料一覧画面に遷移した場合' do
      it 'customer1の持つ一般資料のみが表示される' do
        user_login
        find(:xpath, '/html/body/div/div/div/div[2]/div[2]/div[1]/a/div').click
        find(".general_document_button").click
        # binding.irb
        expect(page).to have_content 'customer_document1'
      end
    end
  end
end
