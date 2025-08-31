FactoryBot.define do
  factory :book do
    title { "The Hobbit" }
    association :author
    association :bookcase
  end
end