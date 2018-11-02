FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::Dune.quote }
    price { Faker::Number.decimal(2) }
    author { Faker::Book.publisher }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    edithor { Faker::Book.author }
    year { Faker::Number.between(1990, 2018) }
    association :user, factory: :user
  end
end
