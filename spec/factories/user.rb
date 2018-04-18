FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "#{n}"}
    first_name Faker::ParksAndRec.character
    last_name Faker::ParksAndRec.city
    provider "google"
    email "sebastian@gmail.com"
    token "123abc"
  end
end
