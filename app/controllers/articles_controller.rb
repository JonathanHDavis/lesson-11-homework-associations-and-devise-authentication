class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      flash.now[:error] = "An error occurred while saving this article"
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "Article was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this Article"
      render :edit
    end
  end

  def destroy
    @article.destroy

    redirect_to articles_path, notice: "Article was successfully deleted"
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id, :bio, :tag_ids => [])
  end
end

