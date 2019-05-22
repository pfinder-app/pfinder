require 'rails_helper'

RSpec.describe User, type: :model do
  context 'load user from database' do
    let(:user) { create(:user) }
    subject { User.find(user.id) }

    it { is_expected.to be_truthy }
  end
end
