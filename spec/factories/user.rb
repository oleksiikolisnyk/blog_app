FactoryBot.define do
  factory :user do
    name { Faker::Name.female_first_name }
    email { Faker::Internet.email }
    password { 'password123' }
    role { 'writer' }
  end
end
