# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
  end
end
