FactoryBot.define do
  factory :book do
    genre       { Faker::Book.genre }
    author      { Faker::Book.author }
    image       { Faker::Avatar.image }
    title       { Faker::Book.title }
    editor      { Faker::Book.publisher }
    year        { Faker::Date.between(2.days.ago, Time.zone.today) }
  end
end
