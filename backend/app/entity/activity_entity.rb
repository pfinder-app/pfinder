# frozen_string_literal: true

class ActivityEntity < Grape::Entity
  expose :id, :place, :title, :begins_at, :duration, :description, :creator_id, :max_participants
end
