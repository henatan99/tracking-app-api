FactoryBot.define do
    factory :user do
        value { Faker::Number.number(10) }
        user_id nil
        measurement_id nil
    end
end