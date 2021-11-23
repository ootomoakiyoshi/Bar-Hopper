FactoryBot.define do
  factory :bar do
    bar_name { Faker::Lorem.characters(number:5) }
    caption { Faker::Lorem.characters(number:20) }
    user
  end
end