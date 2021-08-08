require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '名前が正しく入力されていないときエラー文が表示される テキストRspec1のテスト' do
      user = User.new
      expect(user).not_to be_valid
      # binding.irb
      expect(user.errors[:name]).to include('を入力してください')
    end
    it '名前が正しく入力されていないときエラー文が表示される テキストRspec3のテスト' do
      user = User.new(name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end
    it '名前の文字数が255文字を超えるとエラー文が表示される' do
      user = User.new(name: 'a' * 256)
      user.valid?
      # binding.irb
      expect(user.errors[:name]).to include('は255文字以内で入力してください')
    end
  end
end
