class EventPolicy < ApplicationPolicy
  def update?
    user_is_owner?
  end

  def create?
    user.user.present?
  end

  def show?
    if record.pincode.blank? || user_is_owner?
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

  private

  def user_is_owner?
    user.present? && (record.user == user.user)
  end

  def correct_pincode?
    if user.params[:pincode].present? && record.pincode_valid?(user.params[:pincode])
      user.params[:cookies].permanent["events_#{record.id}_pincode"] = user.params[:pincode]
    end

    record.pincode_valid?(user.params[:cookies].permanent["events_#{record.id}_pincode"])
  end
end
