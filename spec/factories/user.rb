FactoryBot.define do
  factory :user do
    first_name  { Faker::Name.unique.clear }
    last_name { Faker::Name.unique.clear }
    sequence(:email) { |n| "#{n}-" + Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    locale { 'en' }
  end
end
