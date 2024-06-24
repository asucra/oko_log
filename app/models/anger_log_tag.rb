class AngerLogTag < ApplicationRecord
  belongs_to :tag
  belongs_to :anger_log

  validates :tag_id, uniqueness: { scope: :anger_log_id }
end
