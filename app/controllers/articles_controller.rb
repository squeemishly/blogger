class ArticlesController < ApplicationController
  before_action :set_article, only: [:destroy, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "'#{@article.title}' has been created!"

    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy

    flash.notice = "'#{@article.title}' has been completely deleted."

    redirect_to ('/articles')
  end

  def edit
  end

  def update
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
