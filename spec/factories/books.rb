FactoryBot.define do
    factory :book do
      gender { Faker::Food.dish }
      author { Faker::Simpsons.character }
      image { Faker::Simpsons.quote }
      title { Faker::Food.dish }
      editor { Faker::Simpsons.location }
      year { 1993 }
    end
end
