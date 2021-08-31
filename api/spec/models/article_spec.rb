require 'rails_helper'

# RSpec.describe Article, type: :model do
#   # pending "add some examples to (or delete) #{__FILE__}"

#   it "tests a number to be positive" do
#     # expect(1).to(be_positive)           # like running: be_positive => 1.positive? == true
#     # expect(5).to be > 3
    
#     # article = FactoryBot.create(:article)
#     article = create(:article)                # syntax improvement from the previous line
#     expect(article.title).to eq('Sample Article')
#   end
# end

RSpec.describe Article, type: :model do
  describe '#validations' do
    let(:article) { build(:article) } 

    it "tests that a factory is valid" do
      expect(article).to be_valid               # article.
      article.save!
      another_article = build(:article)
      expect(another_article).to be_valid
    end

  
    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
    
    it 'has an invalid content' do 
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'validates the uniqueness of the slug' do
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
        expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include ('has already been taken')
    end
  end
end
