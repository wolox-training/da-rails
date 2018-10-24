FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    encrypted_password { Faker::Crypto.sha1 }
    reset_password_token { Faker::Crypto.sha1 }
    reset_password_sent_at { Faker::Time.between(2.days.ago, Time.now.utc) }
    name { Faker::Name.middle_name }
    nickname { Faker::Lorem.word }
    password { Faker::Internet.password }
    image { Faker::File.file_name('path/to') }
  end
end
