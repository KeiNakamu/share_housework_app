# require 'rails_helper'

# RSpec.describe Article, type: :model do
#   let!(:user) { FactoryBot.create(:user) }
#   let!(:article) { FactoryBot.create(:article, user:user) }
#   let!(:article_private) { FactoryBot.create(:article_private, user:user) }

#   describe '記事モデル機能', type: :model do
#     describe 'バリデーションのテスト', type: :model do
#       context '記事のタイトルが空の場合' do
#         it 'バリデーションにひっかる' do
#           article = Article.new(title: '', status: 'public')
#           expect(article).not_to be_valid
#         end
#       end
#         it 'バリデーションにひっかる' do
#           article = Article.new(title: '', status: 'private')
#           expect(article).not_to be_valid
#         end
#       context '記事のタイトルは記載されているが、255文字以上の場合' do
#         it 'バリデーションにひっかる' do
#           article = Article.new(title: 'a' * 256, status: 'public')
#           expect(article).not_to be_valid
#         end
#         it 'バリデーションにひっかる' do
#           article = Article.new(title: 'a' * 256, status: 'private')
#           expect(article).not_to be_valid
#         end
#       end  
#       context '記事のタイトルが記載されている場合' do
#         it 'バリデーションが通る' do
#           article = FactoryBot.create(:article, user: user)
#           expect(article).to be_valid
#         end
#         it 'バリデーションが通る' do
#           article = FactoryBot.create(:article_private, user: user)
#           expect(article).to be_valid
#         end
#       end
#     end
#   end
# end