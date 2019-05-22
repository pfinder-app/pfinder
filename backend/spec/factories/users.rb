# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    scoutname { Faker::Lorem.word }
    scoutgroup { Faker::Lorem.word }
    canton { :zh }
    birthdate { Faker::Date.birthday(18, 50) }
  end
end
