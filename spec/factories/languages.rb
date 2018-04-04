# frozen_string_literal: true

FactoryBot.define do
  factory :language do
    code  { Faker::Lorem.words(3) }
  end
end
