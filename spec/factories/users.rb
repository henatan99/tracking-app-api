FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
  end
end
