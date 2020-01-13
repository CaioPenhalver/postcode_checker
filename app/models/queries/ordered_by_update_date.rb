# frozen_string_literal: true

module Queries::OrderedByUpdateDate
  def ordered_by_update_date(type = :desc, page: 1, per_page: 10)
    paginate(page: page, per_page: per_page)
      .order(updated_at: type)
  end
end
