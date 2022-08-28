require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーモデルのバリデーションテスト', type: :model do
    context 'Eメールの入力欄が空の場合' do
      it 'バリデーションにひっかかる' do
        user = User.new(email: '', password: 'password', password_confirmation: 'password')
        expect(user).not_to be_valid
      end
    end
    context '全ての項目が入力されている場合' do
      it 'ユーザーが登録できる' do
        user = User.new(email: 'test@example.com', password: 'password', password_confirmation: 'password')
        expect(user).to be_valid
      end
    end
  end
end