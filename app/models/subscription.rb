class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do |user|
    user.validates :user, uniqueness: {scope: :event_id}
    user.validate :self_subscription
  end

  with_options unless: -> { user.present? } do |user|
    user.validates :user_name, presence: true
    user.validates :user_email, uniqueness: {scope: :event_id}, presence: true,
              format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
    user.validate :used_email
  end

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def used_email
    if User.find_by(email: user_email).present?
      errors.add(:user_email, :used_email)
    end
  end

  def self_subscription
    if event.user == user
      errors.add(:user_email, :self_subscription)
    end
  end
end
