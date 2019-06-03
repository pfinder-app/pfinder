# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    place { Faker::Address.city }
    title { Faker::Lorem.word }
    begins_at { Faker::Date.forward(23) }
  end
end
