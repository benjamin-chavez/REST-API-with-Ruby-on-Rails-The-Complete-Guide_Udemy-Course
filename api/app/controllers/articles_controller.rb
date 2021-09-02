class ArticlesController < ApplicationController
  def index
    # render json: {}, status: 200
    # render json: {}, status: :ok
    # render json: Article.all, status: :ok
    # articles = Article.all
    articles = Article.recent
    render json: serializer.new(articles), status: :ok
  end

  def serializer
    ArticleSerializer
  end

  def show
  end
end
