# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :creator, class_name: 'User'
end
