class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :article_params, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, article_id: @article.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: @article.id)
    like.destroy
  end

  private
  def article_params
    @article = Article.find(params[:article_id])
  end
end