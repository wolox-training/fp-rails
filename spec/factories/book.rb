FactoryBot.define do
  factory :book do
    genre       { Faker::Book.genre }
    author      { Faker::Book.author }
    image       { 'troll.jpg' }
    title       { Faker::Book.title }
    editor      { Faker::Book.publisher }
    year        { Time.new.in_time_zone(-5).beginning_of_year }
  end
end
