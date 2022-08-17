class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update destroy ]
  before_action :set_q, only: [:index, :search]

  def index
    @articles = Article.all
  end

  def show
    @procedures = @article.procedures
    @comments = @article.comments
    @comment = @article.comments.build
    @favorite = current_user.favorites.find_by(article_id: @article.id) if  user_signed_in?
  end

  def new
    @article = Article.new
    @procedure = @article.procedures.build
  end

  def edit
    @article = Article.find(params[:id])
    @procedure = Procedure.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
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

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Article.ransack(params[:q])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :image, :image_cache, :status, :deadline, :date, :user_id, { category_ids: [] }, procedures_attributes: [:image, :content, :article_id, :user_id, :_destroy, :id])
  end
end
