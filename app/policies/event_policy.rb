class EventPolicy < ApplicationPolicy
  def update?
    user_is_owner?(record)
  end

  def create?
    user.present?
  end

  def show?
    true
  end

  def new?
    user.present?
  end

  def edit?
    user_is_owner?(record)
  end

  def destroy?
    user_is_owner?(record)
  end

  private

  def user_is_owner?(event)
    user.present? && (event.user == user)
  end
end
