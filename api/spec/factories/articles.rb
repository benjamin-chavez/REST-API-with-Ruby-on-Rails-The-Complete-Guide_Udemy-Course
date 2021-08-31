FactoryBot.define do
  factory :article do
    title { "Sample Article" }
    content { "Sample content" }
    # slug { "sample-article" }
    sequence(:slug) { |n| "#{n}" }
  end
end
