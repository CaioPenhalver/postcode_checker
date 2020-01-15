# frozen_string_literal: true

# Model that represents postcode
class Postcode < ApplicationRecord
  extend Queries::OrderedByUpdateDate

  POSTCODE_FORMAT = /([Gg][Ii][Rr]0[Aa]{2})|((([A-Za-z][0-9]{1,2})|
                     (([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|
                     (([A-Za-z][0-9][A-Za-z])|
                     ([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))
                     \s?[0-9][A-Za-z]{2})\Z/x.freeze

  validates :value,
            uniqueness: true,
            format: { with: POSTCODE_FORMAT, message: 'format error' }

  before_save do
    self.value = value.upcase.gsub(' ', '')
  end
end
