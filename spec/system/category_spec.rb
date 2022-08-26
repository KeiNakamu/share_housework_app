require 'rails_helper'
RSpec.describe 'カテゴリ機能', type: :system do

  let!(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category) }
  let!(:second_category) { FactoryBot.create(:second_category) }
  let!(:third_category) { FactoryBot.create(:third_category) }

  describe 'カテゴリ管理機能' do

    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
    end

    before do
      visit new_article_path
      fill_in "article[title]", with:"test"
      check 'カテゴリ１'
      check 'カテゴリ２'
      click_button '投稿する'
      click_button '登録する'
    end

    context 'カテゴリを選択して記事を新規作成した場合' do
      it '作成した記事に複数のラベルが表示される' do
        expect(page).to have_content 'カテゴリ１'
        expect(page).to have_content 'カテゴリ２'
      end
    end
    context '記事の詳細画面に遷移した場合' do
      it 'その記事に紐付いているカテゴリが出力される' do
        visit articles_path
        find(:xpath, '/html/body/div[1]/div/div[2]/div/div[1]/div/a').click
        expect(page).to have_content 'カテゴリ１'
        expect(page).to have_content 'カテゴリ２'
      end
    end
    context '記事を編集した場合' do
      it '記事に紐付いているカテゴリも編集できる' do
        visit articles_path
        find(:xpath, '/html/body/div[1]/div/div[2]/div/div[1]/div/a').click
        click_link '編集', match: :first
        fill_in "article[title]", with:"test"
        check 'カテゴリ３'
        click_button '投稿する'
        expect(page).to have_content 'カテゴリ３'
      end
    end
    context 'カテゴリを検索した場合' do
      it 'カテゴリに一致する記事が絞り込まれる' do
        visit articles_path
        check 'カテゴリ１'
        click_on '検索'
        expect(page).to have_content 'カテゴリ１'
      end
    end
  end
end