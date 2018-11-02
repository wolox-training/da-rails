FactoryBot.define do
  factory :book do
    gender { Faker::Food.dish }
    author { Faker::Simpsons.character }
    image { Faker::Simpsons.quote }
    title { Faker::Food.dish }
    editor { Faker::Simpsons.location }
    year { Faker::Number.between(1900, 2018) }
  end
end
