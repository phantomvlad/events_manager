class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :comments
  has_many :subscriptions
  has_many :photos

  has_one_attached :avatar do |attachable|
    attachable.variant :show, resize_to_limit: [400, 400]
    attachable.variant :mini, resize_to_limit: [200, 200]
  end

  validates :name, presence: true, length: {maximum: 35}

  validates :avatar,
            content_type: %w[image/jpeg image/png image/gif],
            size: { less_than: 5.megabytes }

  after_commit :link_subscriptions, on: :create

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
                .update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
