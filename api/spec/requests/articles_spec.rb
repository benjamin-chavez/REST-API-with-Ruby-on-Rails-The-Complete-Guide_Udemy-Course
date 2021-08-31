require 'rails_helper'

# RSpec.describe "Articles", type: :request do
# end

RSpec.describe ArticlesController do
  describe '#index' do
    it 'returns a success response' do
      get '/articles'
      # expect(response).to have_http_status(:ok)
      expect(response).to have_http_status(200)
    end

    it 'returns a proper JSON' do 
      article = create :article
      get '/articles'
      # body = JSON.parse(response.body).deep_symbolize_keys
      # # pp body
      expect(json_data.length).to eq(1)
      expected = json_data.first
      aggregate_failures do
        expect(expected[:id]).to eq(article.id.to_s)
        expect(expected[:type]).to eq('article')
        expect(expected[:attributes]).to eq(
          title: article.title,
          content: article.content,
          slug: article.slug
        )
      end
      # THE FOLLOWING BLOCK OF CODE WAS IMPROVED THROUGH THE AGGREGATE FAILURES BLOCK ABOVE
      # expect(json_data).to eq(
      #   [
      #     {
      #       id: article.id.to_s,
      #       type: 'article',
      #       # type: 'articles',
      #       attributes: {
      #         title: article.title,
      #         content: article.content,
      #         slug: article.slug
      #       }
      #     }
      #   ]
      # )
    end
  end
end