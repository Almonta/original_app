require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:customer) { FactoryBot.create(:customer, user: user) }

  describe 'バリデーションテスト' do
    context '製造番号が空欄の場合' do
      it 'エラーとなりエラー文が表示される' do
        schedule = customer.schedules.build(serial_number: nil)
        expect(schedule).not_to be_valid
        expect(schedule.errors[:serial_number]).to be_present
      end
    end

    context '番号の桁数が255文字を超える場合' do
      it 'エラーとなりエラー文が表示される' do
        schedule = customer.schedules.build(serial_number: '1' * 256)
        schedule.valid?
        # binding.irb
        expect(schedule.errors[:serial_number]).to include('は255文字以内で入力してください')
      end
    end
  end
end
