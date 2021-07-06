FactoryBot.define do
    factory :measurement do
        name { Faker::StarWars.word }
        unit { Faker::Lorem.word('cm') }
    end
end