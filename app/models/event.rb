class Event < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos
  has_one_attached :event_avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [300, 300]
    attachable.variant :big, resize_to_limit: [1200, 1200]
  end
  validates :event_avatar, content_type: %w[image/jpeg image/png image/gif],
    size: { less_than: 5.megabytes }

  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true
  validates :user, presence: true

  def visitors
    (subscribers + [user]).uniq
  end

end
