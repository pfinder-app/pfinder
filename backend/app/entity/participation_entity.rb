# frozen_string_literal: true

class ParticipationEntity < Grape::Entity
  expose :id, :user_id, :activity_id, :canceled_at
end
