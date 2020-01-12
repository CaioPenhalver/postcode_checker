# frozen_string_literal: true

FactoryBot.define do
  factory :district do
    sequence(:name) { |n| "District #{n}" }
  end
end
