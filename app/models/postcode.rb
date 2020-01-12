# frozen_string_literal: true

class Postcode < ApplicationRecord
  POSTCODE_FORMAT = /([Gg][Ii][Rr]0[Aa]{2})|((([A-Za-z][0-9]{1,2})|
                     (([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|
                     ([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})\Z/x.freeze

  validates :value,
            uniqueness: true,
            format: { with: POSTCODE_FORMAT, message: 'format error' }

  class << self
    def ordered_by_update_date(type = :desc, page: 1, per_page: 10)
      paginate(page: page, per_page: per_page)
        .order(updated_at: type)
    end
  end
end
