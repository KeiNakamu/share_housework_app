class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんの投稿した記事をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんの投稿した記事をお気に入り解除しました"
  end
end
