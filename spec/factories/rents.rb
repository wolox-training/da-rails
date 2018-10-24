FactoryBot.define do
  factory :rent do
    association :user, factory: :user
    association :book, factory: :book
    init_date { '2018-10-19' }
    end_date { '2018-10-19' }
  end
end
