class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def show
    find_article(params[:id])
    #@article = Article.find(params[:id])
  end

  def edit
    find_article(params[:id])
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
    find_article(params[:id])
    if @article.destroy
      redirect_to root_path
      flash[:success] = "Blog post successfully deleted"
    else
      flash[:error] = "Failed to delete article"
      render 'show'
    end
  end

  def update
    find_article(params[:id])
    if @article.update_attributes(params[:article])
      flash[:success] = "Blog post successfully updated"
      redirect_to article_path(@article)
    else
      flash[:error] = "Updating article failed!"
      redirect_to article_path(@article) and return
    end
  end

  private

    def find_article(id)
      begin
        @article = Article.find(id)
      rescue ActiveRecord::RecordNotFound
        flash[:error] = "Invalid article id"
        redirect_to root_path
      end
    end
end
