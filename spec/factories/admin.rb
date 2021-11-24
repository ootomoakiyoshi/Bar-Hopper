FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    phone_number { 12345678909 }
    password { 'password' }
    password_confirmation { 'password' }
  end
end