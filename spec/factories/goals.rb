FactoryBot.define do
    factory :goal do
      quantity { Faker::Number.number(10) }
      day_one { Faker::Date.today }
      day_last { Faker::Date.today }
      user_id nil
      measurement_id nil
    end
end