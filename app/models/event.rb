class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :photos, dependent: :destroy
  has_one_attached :event_avatar, dependent: :destroy do |attachable|
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

  def pincode_valid?(pin2chek)
    pincode == pin2chek
  end
end
