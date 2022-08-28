require 'rails_helper'

RSpec.describe Procedure, type: :model do
  let!(:article) { FactoryBot.create(:article) }
  describe 'Procedureモデルのバリデーションテスト', type: :model do
    context '入力欄が空の場合' do
      it 'バリデーションにひっかかる' do
        procedure = Procedure.new(content: '')
        expect(procedure).not_to be_valid
      end
    end
    context '入力欄に入力されている場合' do
      it '登録ができる' do
        procedure = Procedure.new(content: 'test', article: article)
        expect(procedure).to be_valid
      end
    end
  end
end