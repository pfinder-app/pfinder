# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    place { Faker::Address.city }
    title { Faker::Lorem.word }
    begins_at { Faker::Date.forward(23) }
    creator { build(:user) }

    # trait :with_participations do
    #   transient :count
  end
end
