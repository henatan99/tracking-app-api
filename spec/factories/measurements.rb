FactoryBot.define do
    factory :user do
        name { Faker::Lorem.word }
        unit { Faker::Lorem.word('cm') }
    end
end