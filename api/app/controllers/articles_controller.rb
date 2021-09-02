class ArticlesController < ApplicationController
  include Paginable
  def index
    # render json: {}, status: 200
    # render json: {}, status: :ok
    # render json: Article.all, status: :ok
    # articles = Article.all

    
    # articles = Article.recent
    # paginated = paginator.call(
    #   articles,
    #   params: pagination_params,
    #   base_url: request.url
    # )
    paginated = paginate(Article.recent)
    # options = { meta: paginated.meta.to_h, links: paginated.links.to_h}
    render_collection(paginated)

    # # render json: serializer.new(articles), status: :ok
    # # replace the previous line as follows once you add the pagination gems
    # render json: serializer.new(paginated.items, options), status: :ok
  end

  def serializer
    ArticleSerializer
  end

  def show
  end

  # The following to method have been moved to the paginable.rb file
  # def paginator
  #   JSOM::Pagination::Paginator.new
  # end

  # def pagination_params
  #   params.permit![:page]
  # end
  

end
