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
      expect(article).to be_valid               # article.valid? == true
    end
  
    it 'has an invalid title' do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end
  end
end
