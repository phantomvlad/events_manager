class EventPolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    user_is_owner?
  end

  def create?
    user.user.present?
  end

  def show?
    if record.pincode.blank? || user_is_owner? || user.params[:cookies].permanent["events_#{record.id}_pincode"] == record.pincode
      true
    else
      correct_pincode?
    end
  end

  def new?
    user.present?
  end

  def edit?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?
    user.present? && (record.user == user.user)
  end

  def correct_pincode?
    record.pincode_valid?(user.params[:pincode])
  end
end

