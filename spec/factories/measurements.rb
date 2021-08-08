# frozen_string_literal: true

FactoryBot.define do
  factory :measurement do
    name { Faker::Lorem.word }
    unit { Faker::Lorem.word }
  end
end
