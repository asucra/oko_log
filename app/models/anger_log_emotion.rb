class AngerLogEmotion < ApplicationRecord
  belongs_to :anger_log
  belongs_to :emotion

  validates :anger_log_id, uniqueness: { scope: :emotion_id }
end
