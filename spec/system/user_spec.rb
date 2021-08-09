require 'rails_helper'

RSpec.describe 'ログイン機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:admin) { FactoryBot.create(:admin) }
  # let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  # let!(:second_task) { FactoryBot.create(:second_task, user_id: user.id) }
  # let!(:third_task) { FactoryBot.create(:third_task, user_id: user.id) }
  # before do
  #   # visit new_session_path
  # end
  
  # def user_login
  #   fill_in 'session_email', with: 'test_user1@sample.com'
  #   fill_in 'session_password', with: 'pass1'
  #   click_on 'Log in'
  # end

  # def admin_login
  #   fill_in 'session_email', with: 'test_user3@sample.com'
  #   fill_in 'session_password', with: 'pass3'
  #   click_on 'Log in'
  # end

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
  end
end