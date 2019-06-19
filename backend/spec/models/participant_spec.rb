# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participation, type: :model do
  subject { build(:participation) }

  context 'with validations' do
    it { is_expected.to validate_uniqueness_of(:user) }
  end

  context 'with relations' do
    it { is_expected.to belong_to(:creator) }
  end
end
