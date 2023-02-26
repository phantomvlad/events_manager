require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { create :user }
  let(:user_true) { create :user}
  let(:event) { create :event, user: user_true }

  subject { EventPolicy }

  permissions :create? do
    it { is_expected.to permit(user, event) }
    it { is_expected.not_to permit(nil, event) }
  end

  permissions :show? do
    it { is_expected.to permit(user, event) }
    it { is_expected.to permit(nil, event) }
  end

  permissions :new? do
    it { is_expected.to permit(user, Event) }
    it { is_expected.not_to permit(nil, Event) }
  end

  permissions :edit? do
    it { is_expected.to permit(user_true, event) }
    it { is_expected.not_to permit(nil, event) }
    it { is_expected.not_to permit(user, event) }
  end

  permissions :update? do
    it { is_expected.to permit(user_true, event) }
    it { is_expected.not_to permit(nil, event) }
    it { is_expected.not_to permit(user, event) }
  end

  permissions :destroy? do
    it { is_expected.to permit(user_true, event) }
    it { is_expected.not_to permit(nil, event) }
    it { is_expected.not_to permit(user, event) }
  end
end
