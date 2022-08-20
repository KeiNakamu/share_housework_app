class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites
  end

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
  end
end
