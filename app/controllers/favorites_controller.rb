class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[index create destroy]

  def index
    @favorites = current_user.favorites
  end

  def create
    @article = Article.find(params[:article_id])
    Favorite.create(user_id: current_user.id, article_id: params[:article_id])
  end

  def destroy
    @article = Article.find(params[:article_id])
    Favorite.find_by(user_id: current_user.id, article_id: params[:article_id]).destroy
  end
end