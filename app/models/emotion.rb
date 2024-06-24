class Emotion < ApplicationRecord
  has_many :anger_log_emotions, dependent: :destroy
  has_many :anger_logs, through: :anger_log_emotions

  validates :name, presence: true, uniqueness: true
end
