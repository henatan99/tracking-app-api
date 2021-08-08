# frozen_string_literal: true

FactoryBot.define do
  factory :goal do
    quantity { Faker::Number.number(10) }
    day_one { Faker::Date.between(from: 2.year.ago, to: Date.today) }
    day_last { Faker::Date.between(from: 2.year.ago, to: Date.today) }
    user_id nil
    measurement_id nil
  end
end
