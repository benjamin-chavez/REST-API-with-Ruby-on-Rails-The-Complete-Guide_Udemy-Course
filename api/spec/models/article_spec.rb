require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "tests a number to be positive" do
    # expect(1).to(be_positive)           # like running: be_positive => 1.positive? == true
    # expect(5).to be > 3
    
    # article = FactoryBot.create(:article)
    article = create(:article)                # syntax improvement from the previous line
    expect(article.title).to eq('Sample Article')
  end
end
