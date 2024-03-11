class LineItemDate < ApplicationRecord
  belongs_to :quote
  validates :date, uniqueness: { scope: :quote_id}

  scope :ordered, -> { order(date: :asc) }
end
