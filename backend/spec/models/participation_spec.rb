# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Participation, type: :model do
  subject(:participation) { build(:participation) }

  context 'with validations' do
    it 'validates only one participation per user and activity' do
      participation.save
      expect(participation.dup.save).to be_falsy
    end
  end
end
