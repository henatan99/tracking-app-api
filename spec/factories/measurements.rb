FactoryBot.define do
    factory :user do
        name { Faker::StarWars.word }
        unit { Faker::Lorem.word('cm') }
    end
end