FactoryBot.define do
  factory :activity do
    place { Faker::Address.city }
    title { Faker::Lorem.word }
  end
end
