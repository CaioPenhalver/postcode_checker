# frozen_string_literal: true

# Model that represents district
class District < ApplicationRecord
  extend Queries::OrderedByUpdateDate

  validates :name,
            uniqueness: true,
            presence: true
end
