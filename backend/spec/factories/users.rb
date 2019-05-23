# frozen_string_literal: true

FactoryBot.define do
  sequence(:email) { |i| "pfinderuser_#{i}@pfinder.local" }

  factory :user do
    name { Faker::Name.first_name }
    scoutname { Faker::Lorem.word }
    scoutgroup { Faker::Lorem.word }
    canton { :zh }
    birthdate { Faker::Date.birthday(18, 50) }
    email
  end
end
