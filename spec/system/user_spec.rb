require 'rails_helper'

RSpec.describe User, type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:admin) { FactoryBot.create(:admin) }

  def user_login
    visit new_user_session_path
    fill_in 'user_email', with: 'user1@sample.com'
    fill_in 'user_password', with: 'pass1111'
    click_button 'ログイン'
  end

  describe 'ユーザ登録' do
    context 'ユーザがサインアップした場合' do
      it 'マイページに、作成ユーザの情報が表示される' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'test_name1'
        select '技術', from: 'user_department'
        fill_in 'user_email', with: 'test_email1@sample.com'
        fill_in 'user_password', with: 'test_password1'
        fill_in 'user_password_confirmation', with: 'test_password1'
        click_button 'サインアップ'
        visit user_path(user)
        expect(page).to have_content 'test_name1'
        expect(page).to have_content '技術'
        expect(page).to have_content 'test_email1@sample.com'
      end
    end
    context 'ログインせずにホーム画面に飛ぼうとした場合' do
      it 'ログインページが表示される' do
        visit homes_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
  describe 'ログイン機能' do
    context 'ログインした場合' do
      it 'ホーム画面が表示される' do
        user_login
        expect(page).to have_content 'Home'
      end
    end
    context 'ログアウトした場合' do
      it 'ログインページが表示される' do
        user_login
        visit homes_path
        click_on 'ログアウト'
        # binding.irb
        expect(page).to have_content 'ログアウトしました'
        expect(current_path).to eq root_path
      end
    end
  end
end
