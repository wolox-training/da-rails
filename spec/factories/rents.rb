FactoryBot.define do
  factory :rent do
    association :user, factory: :user
    association :book, factory: :book
    init_date { Faker::Time.between(5.days.ago, Time.now.utc) }
    end_date { Faker::Time.between(2.days.ago, Time.now.utc) }
  end 
end 
