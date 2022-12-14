class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show task edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update destroy ]

  def index
    if params[:q].present?
      @articles = Article.all.page(params[:page])
      @article_search = @articles.ransack(params[:q])
      @articles = @article_search.result(distinct: true).order(updated_at: "DESC").page(params[:page])
    else
      params[:q] = { sorts: 'updated_at DESC' }
      @articles = Article.all.page(params[:page])
      @article_search = @articles.ransack(params[:q])
      @articles = @article_search.result(distinct: true).order(updated_at: "DESC").page(params[:page])
    end
    @count = @articles.where(status:'public').total_count
  end

  def show
    @articles = Article.all
    @procedures = @article.procedures
    @comments = @article.comments
    @comment = @article.comments.build
    @favorite = current_user.favorites.find_by(article_id: @article.id) if  user_signed_in?
    if @article.status_private? && @article.user != current_user
      redirect_to articles_path, notice: 'このページは非公開のためアクセスできません'
    end
  end

  def task
    @articles = Article.all
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
    if params[:back]
      render :new
    else
      if @article.save
        redirect_to article_path(@article), notice: "作成しました"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: "投稿した記事を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "投稿した記事を削除しました"
  end

  def confirm
    @article = current_user.articles.build(article_params)
    if params[:back]
      render :new if @article.invalid?
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :image, :image_cache, :status, :deadline, :date, :user_id, { category_ids: [] }, procedures_attributes: [:image, :image_cache, :content, :article_id, :user_id, :_destroy, :id])
  end
end
