class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    flash.now[:notice] = "#{favorite.article.user.name}さんの投稿した記事をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    flash[:notice] = "#{favorite.article.user.name}さんの投稿した記事をお気に入り解除しました"
  end
end
