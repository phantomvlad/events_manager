class Event < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true
  validates :user, presence: true
end
