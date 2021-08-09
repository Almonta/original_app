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
        # binding.irb
        expect(current_path).to eq product_path(4)
      end
    end
  end

  describe '一覧表示機能' do
    context 'プロダクト一覧画面に遷移した場合' do
      it '作成済みのプロダクト一覧が表示される' do
        user_login
        visit homes_path
        # binding.irb
        expect(page).to have_content 'product1'
        expect(page).to have_content 'product2'
        expect(page).to have_content 'product3'
      end
    end
  end

  describe '検索機能' do
    context 'プロダクト名で曖昧検索した場合' do
      it '検索キーワードを含むプロダクトのみに絞り込まれる' do
        user_login
        visit homes_path
        fill_in 'search', with: '1'
        search_link = find(:xpath, "/html/body/div/div/div[1]/form/input[3]")
        search_link.click
        expect(page).to have_content 'product1'
        expect(page).not_to have_content 'product2'
      end
    end
  end

  describe 'プロジェクト登録機能' do
    context 'プロダクトをプロジェクト登録した場合' do
      it '登録プロジェクト画面に、登録したプロジェクトが表示される' do
        user_login
        visit homes_path
        first(:link, '詳細').click
        find(".product_project_registration").click
        visit registered_projects_path
        expect(page).to have_content 'product1'
        expect(page).not_to have_content 'product2'
        # binding.irb
      end
    end
  end
end