require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'バリデーションテスト' do
    context '名前が空欄の場合' do
      it 'エラーが表示される' do
        product = user.products.build(name: nil)
        expect(product).not_to be_valid
        expect(product.errors[:base]).to be_present
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
        expect(product.errors[:base]).to be_present
      end
    end
  end
  describe '検索機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:product) { FactoryBot.create(:product, user: user) }
    let!(:second_product) { FactoryBot.create(:second_product, user: user) }
    let!(:third_product) { FactoryBot.create(:third_product, user: user) }
    context 'プロダクトの曖昧検索をした場合' do
      it '検索キーワードを含むプロダクトが絞り込まれる' do
        expect(Product.search_product('1')).to include(product)
        expect(Product.search_product('1')).not_to include(second_product)
        expect(Product.search_product('1').count).to eq 1
      end
    end
  end
end
