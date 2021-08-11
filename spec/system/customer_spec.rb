require 'rails_helper'

RSpec.describe Product, type: :system do
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

  describe '新規作成機能' do
    context 'カスタマーを新規作成した場合' do
      it '詳細画面に遷移し作成したカスタマーが表示される' do
        user_login
        click_button 'カスタマー新規登録'
        fill_in 'customer_number', with: '444'
        fill_in 'customer_name', with: 'customer4'
        click_button '登録する'
        # binding.irb
        expect(page).to have_content '444'
        expect(page).to have_content 'customer4'
        expect(current_path).to eq customer_path(4)
      end
    end
  end

  describe '一覧表示機能' do
    context 'カスタマー一覧画面に遷移した場合' do
      it '作成済みのカスタマー一覧が表示される' do
        user_login
        visit homes_path
        # binding.irb
        expect(page).to have_content 'customer1'
        expect(page).to have_content 'customer2'
        expect(page).to have_content 'customer3'
      end
    end
  end

  describe '検索機能' do
    context 'カスタマー番号で曖昧検索した場合' do
      it '検索キーワードを含むカスタマーのみに絞り込まれる' do
        user_login
        visit homes_path
        # binding.irb
        fill_in 'q_number_cont', with: '11'
        find('input[name="commit"]').click
        expect(page).to have_content '111'
        expect(page).not_to have_content '222'
      end
    end
    context 'カスタマー名で曖昧検索した場合' do
      it '検索キーワードを含むカスタマーのみに絞り込まれる' do
        user_login
        visit homes_path
        fill_in 'q_name_cont', with: '1'
        # search_link = find(:xpath, '//*[@id="customer_search"]/div/div[3]/input')
        # search_link.click
        # customer_word_search_button
        # find(".customer_word_search_button").click
        # click_on 'customer_search_button'
        # find("customer_search_button").click
        find('input[name="commit"]').click
        # binding.irb
        expect(page).to have_content 'customer1'
        expect(page).not_to have_content 'customer2'
      end
    end
  end

  describe 'カスタマー登録機能' do
    context 'カスタマーをプロジェクト登録した場合' do
      it '登録プロジェクト画面に、登録したプロジェクトが表示される' do
        user_login
        visit homes_path
        first(:link, '詳細').click
        find(".product_project_registration").click
        # binding.irb
        visit registered_projects_path
        expect(page).to have_content 'customer1'
        expect(page).not_to have_content 'customer3'
        # binding.irb
      end
    end
  end
end
