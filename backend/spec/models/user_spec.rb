# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.find(user.id) }

  let(:user) { create(:user) }

  it { is_expected.to be_truthy }
end
