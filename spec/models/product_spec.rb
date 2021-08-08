require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  # let!(:product) { FactoryBot.create(:product) }
  describe 'バリデーションテスト' do
    context '名前が空欄の場合' do
      it 'エラーが表示される' do
        product = user.products.build(name: '')
        expect(product).not_to be_valid
        expect(product.errors[:name]).to be_present
      end
    end
    context '名前が記載されている場合' do
      it 'バリデーションが通る' do
        product = user.products.build(name: 'test')
        expect(product).to be_valid
      end
    end
    context '名前の文字数が255文字を超える場合' do
      it 'エラーが表示される' do
        product = user.products.build(name: 'a' * 256)
        user.valid?
        expect(product.errors[:name]).to include('は255文字以内で入力してください')
      end
    end
  end
end
