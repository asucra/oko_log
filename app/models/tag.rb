class Tag < ApplicationRecord
  has_many :anger_log_tags, dependent: :destroy
  has_many :anger_logs, through: :anger_log_tags

  validates :name, presence: true, uniqueness: true
end
