class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update destroy ]

  def index
    @articles = Article.where(status: :public)
    @article_search = @articles.ransack(params[:q])
    @articles = @article_search.result
    @articles = @articles.where(article_categories: ArticleCategory.where(category_id: params[:q][:category_ids])) if params[:q].present? && params[:q][:category_ids].present?
  end

  def show
    @procedures = @article.procedures
    @comments = @article.comments
    @comment = @article.comments.build
    @favorite = current_user.favorites.find_by(article_id: @article.id) if  user_signed_in?
    if @article.status_private? && @article.user != current_user
      redirect_to articles_path, notice: 'このページは非公開のためアクセスできません'
    end
  end

  def new
    @article = Article.new
    @procedure = @article.procedures.build
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  def confirm
    @article = Article.new(article_params)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :image, :image_cache, :status, :deadline, :date, :user_id, { category_ids: [] }, procedures_attributes: [:image, :image_cache, :content, :article_id, :user_id, :_destroy, :id])
  end
end
