class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "melanie", password: "123", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(params.require(:article).permit(:title, :text))

    @article.save
    redirect_to @article
  end
end