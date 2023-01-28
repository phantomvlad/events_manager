class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [300, 300]
    attachable.variant :big, resize_to_limit: [1600, 1600]
  end

  validates :image,
            content_type: %w[image/jpeg image/png image/gif],
            size: { less_than: 5.megabytes },
            presence: true

  scope :persisted, -> { where 'id IS NOT NULL' }
end
