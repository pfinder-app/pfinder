# frozen_string_literal: true

class Participation < ApplicationRecord
  belongs_to :user, inverse_of: :participations
  belongs_to :activity, inverse_of: :participations

  validates :activity, uniqueness: { scope: :user }
end
