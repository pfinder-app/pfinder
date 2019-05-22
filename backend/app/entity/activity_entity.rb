class ActivityEntity < Grape::Entity
  expose :id, :place, :begins_at, :duration, :description, :creator_id, :max_participants
end
