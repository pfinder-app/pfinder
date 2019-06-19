# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :creator, inverse_of: :activities, class_name: 'User'

  validates :title, :place, :begins_at, presence: true
end
