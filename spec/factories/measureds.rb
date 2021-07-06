FactoryBot.define do
    factory :measured do
        value { Faker::Number.number(10) }
        user_id nil
        measurement_id nil
    end
end