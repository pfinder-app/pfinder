# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :creator, inverse_of: :activities, class_name: 'User'
  has_many :participations, inverse_of: :activity
  has_many :users, through: :participations

  validates :title, :place, :begins_at, presence: true
end
