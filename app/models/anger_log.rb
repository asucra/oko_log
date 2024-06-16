class AngerLog < ApplicationRecord
  belongs_to :user

  validates :occurrence_at, presence: true, comparison: { less_than_or_equal_to: Time.current }
  validates :place, presence: true, length: { maximum: 255 }
  validates :event, :thought, presence: true
  validates :anger_level, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10, \
  greater_than_or_equal_to: 1  }
end
