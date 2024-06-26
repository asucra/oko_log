class AngerLog < ApplicationRecord
  belongs_to :user
  has_many :anger_log_tags, dependent: :destroy
  has_many :tags, through: :anger_log_tags
  has_many :anger_log_emotions, dependent: :destroy
  has_many :emotions, through: :anger_log_emotions

  validates :occurrence_at, presence: true
  validate :occurrence_at_cannot_be_in_the_future
  validates :place, presence: true, length: { maximum: 255 }
  validates :event, :thought, presence: true
  validates :anger_level, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10, greater_than_or_equal_to: 1 }

  def save_with_tags_and_emotions(tag_names:, emotion_names:)
    ActiveRecord::Base.transaction do
      self.tags = tag_names.map { |name| Tag.find_or_initialize_by(name: name.strip) }
      self.emotions = emotion_names.map { |name| Emotion.find_or_initialize_by(name: name.strip) }
      save!
    end
  rescue StandardError
    false
  end

  def tag_names
    tags.map(&:name).join(',')
  end

  def emotion_names
    emotions.map(&:name).join(',')
  end

  private

  def occurrence_at_cannot_be_in_the_future
    if occurrence_at.present? && occurrence_at > Time.current
      errors.add(:occurrence_at, 'は現在時刻以前の時刻を入力してください')
    end
  end
end
