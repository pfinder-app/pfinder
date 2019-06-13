# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject { Activity.find(activity.id) }

  let(:user) { create(:user) }
  let(:activity) { create(:activity, creator: user) }

  context 'with validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:place) }
    it { is_expected.to validate_presence_of(:begins_at) }
  end

  context 'with relations' do
    it { is_expected.to belong_to(:creator) }
  end
end
