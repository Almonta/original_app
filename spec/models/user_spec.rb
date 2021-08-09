require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションテスト' do
    context '名前が空欄の場合' do
      it 'エラー文が表示される テキストRspec1のテスト' do
        user = User.new(name: nil,
                        department: 0,
                        email: 'test_user1@sample.com',
                        password: 'test_pass1')
        expect(user).not_to be_valid
        expect(user.errors[:name]).to include('を入力してください')
      end
    end
    context '名前が空欄の場合' do
      it 'エラー文が表示される テキストRspec3のテスト' do
        user = User.new(name: nil,
                        department: 0,
                        email: 'test_user1@sample.com',
                        password: 'test_pass1')
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end
    end
    context 'メールアドレスが空欄の場合' do
      it 'エラー文が表示される' do
        user = User.new(name: 'test1',
                        department: 0,
                        email: nil,
                        password: 'test_pass1')
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end
    end
    context 'パスワードが空欄の場合' do
      it 'エラー文が表示される' do
        user = User.new(name: 'test1',
                        department: 0,
                        email: 'test_user1@sample.com',
                        password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end
    end
    context '名前の文字数が255文字を超える場合' do
      it 'エラー文が表示される' do
        user = User.new(name: 'a' * 266,
                        department: 0,
                        email: 'test_user1@sample.com',
                        password: 'test_pass1')
        user.valid?
        expect(user.errors[:name]).to include('は255文字以内で入力してください')
      end
    end
    context 'メールアドレスの文字数が255文字を超える場合' do
      it 'エラー文が表示される' do
        user = User.new(name: 'test1',
                        department: 0,
                        email: "#{'a' * 256}@sample.com",
                        password: 'test_pass1')
        # binding.irb
        user.valid?
        expect(user.errors[:email]).to include('は255文字以内で入力してください')
      end
    end
    context 'パスワードの文字数が128文字を超える場合' do
      it 'エラー文が表示される' do
        user = User.new(name: 'test1',
                        department: 0,
                        email: 'test_user1@sample.com',
                        password: "#{'a' * 128}_pass1")
        # binding.irb
        user.valid?
        expect(user.errors[:password]).to include('は128文字以内で入力してください')
      end
    end
  end
end
