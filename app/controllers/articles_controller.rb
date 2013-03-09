class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    article = Article.new(params[:article])
    if article.save
      redirect_to root_path
      flash[:success] = "Blog post successfully created"
    else
      redirect_to 'new' and return
    end
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      redirect_to root_path
      flash[:success] = "Blog post successfully deleted"
    else
      flash[:error] = "Failed to delete article"
      render 'show'
    end
  end

  def update
    article = Article.find(params[:id])
    if article.update_attributes(params[:article])
      flash[:success] = "Blog post successfully updated"
      redirect_to article_path(article)
    else
      flash[:error] = "Updating article failed!"
      redirect_to article_path(article) and return
    end
  end
end
