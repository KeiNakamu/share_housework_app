require 'rails_helper'

describe 'カテゴリモデルのバリデーションテスト', type: :model do
  context' '
  it 'カテゴリ名の入力欄が空の場合、バリデーションにひっかかる' do
    category = Category.create(name: "")
    expect(category).not_to be_valid
  end
  it '全ての項目が入力されていれば、登録できる' do
    category = Category.create(name: 'test')
    expect(category).to be_valid
  end
end