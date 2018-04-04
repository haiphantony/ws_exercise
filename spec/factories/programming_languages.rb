# frozen_string_literal: true

FactoryBot.define do
  factory :programming_language do
    name  { Faker::Lorem.words(4) }
  end
end
