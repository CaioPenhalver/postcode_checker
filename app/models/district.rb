# frozen_string_literal: true

class District < ApplicationRecord
  extend Queries::OrderedByUpdateDate

  validates :name,
            uniqueness: true,
            presence: true
end
