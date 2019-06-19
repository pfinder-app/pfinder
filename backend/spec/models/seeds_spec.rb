# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'seeds.rb' do
  it 'can populate the app with some data' do
    load(Rails.root.join('db', 'seeds.rb'))
    expect(User.count).to eq(2)
    expect(Activity.count).to eq(1)
  end
end
