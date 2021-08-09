require 'rails_helper'

RSpec.describe Customer, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'バリデーションテスト' do
    context '番号が空欄の場合' do
      it 'エラーが表示される' do
        customer = user.customers.build(number: nil, name: 'test')
        expect(customer).not_to be_valid
        expect(customer.errors[:number]).to be_present
      end
    end
    context '名前が空欄の場合' do
      it 'エラーが表示される' do
        customer = user.customers.build(number: '123', name: nil)
        expect(customer).not_to be_valid
        expect(customer.errors[:name]).to be_present
      end
    end
    context '番号と名前が記載されている場合' do
      it 'バリデーションが通る' do
        customer = user.customers.build(number: '123', name: 'test')
        expect(customer).to be_valid
      end
    end
    context '番号の数が255文字を超える場合' do
      it 'エラーが表示される' do
        customer = user.customers.build(number: 'a' * 256, name: 'test')
        customer.valid?
        expect(customer.errors[:number]).to include('は255文字以内で入力してください')
      end
    end
    context '名前の文字数が255文字を超える場合' do
      it 'エラーが表示される' do
        customer = user.customers.build(number: '123', name: 'a' * 256)
        customer.valid?
        expect(customer.errors[:name]).to include('は255文字以内で入力してください')
      end
    end
  end
end
