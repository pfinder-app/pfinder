# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject { Activity.find(activity.id) }

  let(:activity) { create(:activity) }

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:place) }
    it { should validate_presence_of(:begins_at) }
  end

  context 'relations' do
    it { should belong_to(:creator) }
  end
end
