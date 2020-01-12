FactoryBot.define do
  factory :postcode do
    sequence(:value) { |n| "SE#{n > 10 ? n : '0' + n.to_s}QD" }
  end
end
