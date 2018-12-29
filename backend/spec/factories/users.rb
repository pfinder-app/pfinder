FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    scoutname { Faker::Lorem.word }
    scoutgroup { Faker::Lorem.word }
    canton { :zh }
    birthdate { Faker::Date.birthday(18, 50) }
  end
end
