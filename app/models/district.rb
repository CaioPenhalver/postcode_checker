# frozen_string_literal: true

class District < ApplicationRecord
  validates :name,
            uniqueness: true,
            presence: true
end
