require 'rails_helper'

RSpec.describe ProductDocument, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product, user: user) }
  # let!(:product) { FactoryBot.create(:product) }
  # 以下の方法でproduct_documentが作れない！
  # let!(:product_document) { FactoryBot.create(:product_document, user: user, product: product) }
  # let!(:product_document) { FactoryBot.create(:product_document) }

  describe 'バリデーションテスト' do
    context '資料名が空欄の場合' do
      it 'エラーが表示される' do
        # product_document =@product_document
        # binding.irb
        product_document = user.product_documents.build(name: nil,
                                                        content: 'test',
                                                        document: 'test',
                                                        public_level: 0)
        # binding.irb
        expect(product_document).not_to be_valid
        expect(product_document.errors[:name]).to be_present
      end
    end
    context '概要が空欄の場合' do
      it 'エラーが表示される' do
        product_document = user.product_documents.build(name: 'test',
                                                        content: nil,
                                                        document: 'test',
                                                        public_level: 0)
        expect(product_document).not_to be_valid
        expect(product_document.errors[:content]).to be_present
      end
    end
    context '公開レベルが未選択の場合' do
      it 'エラーが表示される' do
        product_document = user.product_documents.build(name: 'test',
                                                        content: 'test',
                                                        document: 'test',
                                                        public_level: nil)
        expect(product_document).not_to be_valid
        expect(product_document.errors[:public_level]).to be_present
      end
    end

    context '名前と概要と公開レベルの全てが入力されている場合' do
      it 'バリデーションが通る' do
        # let!(:product_document) { FactoryBot.create(:product_document, user: user, product:user.prroducts.first) }
        # product = user.products.build(name: 'test')
        # product_document = user.product_documents.build
        product_document = product.product_documents.build(user: user,
                                                           name: 'test',
                                                           content: 'test',
                                                           document: 'test',
                                                           public_level: 0)
        # binding.irb
        expect(product_document).to be_valid
      end
    end

    context '資料名の文字数が255文字を超える場合' do
      it 'エラーが表示される' do
        product_document = user.product_documents.build(name: 'a' * 256,
                                                        content: 'test',
                                                        document: 'test',
                                                        public_level: 0)
        product_document.valid?
        expect(product_document.errors[:name]).to include('は255文字以内で入力してください')
      end
    end
    context '概要の文字数が1000文字を超える場合' do
      it 'エラーが表示される' do
        product_document = user.product_documents.build(name: 'test',
                                                        content: 'a' * 1001,
                                                        document: 'test',
                                                        public_level: 0)
        user.valid?
        expect(product_document.errors[:content]).to include('は1000文字以内で入力してください')
      end
    end
  end
end
