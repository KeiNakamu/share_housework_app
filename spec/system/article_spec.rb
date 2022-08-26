# require 'rails_helper'

# RSpec.describe '記事機能', type: :system do

#   let!(:user) { FactoryBot.create(:user) }
#   let!(:second_user) { FactoryBot.create(:second_user) }
#   let!(:article) { FactoryBot.create(:article, user: user) }
#   let!(:second_article) { FactoryBot.create(:second_article, user: user) }

#   describe '記事のCRUD機能' do
#     before do
#       visit new_user_session_path
#       fill_in 'user[email]', with: 'test@example.com'
#       fill_in 'user[password]', with: 'password'
#       click_button 'ログイン'
#     end
#     context '公開記事を新規作成した場合' do
#       it '作成した公開記事が表示される' do
#         click_link '投稿する'
#         fill_in 'article[title]', with: 'test'
#         click_button '投稿する'
#         click_button '登録する'
#         expect(page).to have_content 'test'
#         expect(page).to have_content '作成しました'
#       end
#     end
#     context '非公開記事を新規作成した場合' do
#       it '作成した非公開記事が表示される' do
#         click_link '投稿する'
#         fill_in 'article[title]', with: 'test'
#         select '非公開', from: 'article[status]'
#         fill_in "article[date]", with: DateTime.now
#         fill_in "article[deadline]", with: DateTime.now
#         click_button '投稿する'
#         click_button '登録する'
#         expect(page).to have_content 'test'
#         expect(page).to have_content 'この記事は非公開です'
#       end
#     end
#     context '記事を編集した場合' do
#       it '編集した記事が表示される' do
#         click_link 'マイページ'
#         find(:xpath, '/html/body/div[4]/div[1]/div/div/a').click
#         click_on '編集'
#         fill_in 'article[title]', with:'test2'
#         click_button '投稿する'
#         expect(page).to have_content '投稿した記事を更新しました'
#       end
#     end
#     context '記事を削除した場合' do
#       it '削除した記事が表示されない' do
#         click_link 'マイページ'
#         find(:xpath, '/html/body/div[4]/div[1]/div/div/a[1]/img').click
#         click_on '削除'
#         page.driver.browser.switch_to.alert.accept
#         expect(page).to have_content '削除しました'
#       end
#     end
#     context 'ログインをしていない場合' do
#       it '記事が投稿できない' do
#         visit root_path
#         expect(page).not_to have_button '記事投稿'
#       end
#     end
#   end

#   describe '検索機能' do
#     before do
#       visit new_user_session_path
#       fill_in 'user[email]', with: 'test@example.com'
#       fill_in 'user[password]', with: 'password'
#       click_button 'ログイン'
#     end
#     context 'タイトルを検索した場合' do
#       it '検索キーワードを含む記事で絞り込まれる' do
#         visit root_path
#         fill_in 'q[title_cont]', with: 'title'
#         click_button '検索'
#         expect(page).to have_content 'second_title'
#       end
#     end
#     context '古い順でソートした場合' do
#       it '投稿した記事を昇順で表示される' do
#         visit root_path
#         find("#q_sorts").find("option[value='updated_at asc']").select_option
#         expect(Article.order("updated_at asc").map(&:title)).to eq ["タイトル","second_title"]
#       end
#     end
#   end

#   describe 'コメント機能' do
#     context '自分の記事にコメントした場合' do
#       it 'コメントが表示される' do
#         visit new_user_session_path
#         fill_in 'user[email]', with: 'test@example.com'
#         fill_in 'user[password]', with: 'password'
#         click_button 'ログイン'  
#         find(:xpath, '/html/body/div[4]/div[1]/div/div/a[1]/img').click
#         fill_in 'comment[content]', with: 'コメント'
#         click_on 'コメントする'
#         expect(page).to have_content 'コメント'
#       end
#     end
#     context '他のユーザーの記事にコメントした場合' do
#       it 'コメントが表示される' do
#         visit new_user_session_path
#         fill_in 'user[email]', with: 'second@example2.com'
#         fill_in 'user[password]', with: '12345678'
#         click_button 'ログイン'
#         visit articles_path
#         find(:xpath, '/html/body/div[1]/div/div[2]/div/div[1]/div/a').click
#         fill_in 'comment[content]', with: 'コメント'
#         click_on 'コメントする'
#         expect(page).to have_content 'コメント'
#       end
#     end
#   end
# end