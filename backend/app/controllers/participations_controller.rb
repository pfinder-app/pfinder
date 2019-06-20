# frozen_string_literal: true

class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[show destroy]
  before_action :set_activity, only: %i[index create]

  def index
    render_success(ParticipationEntity.represent(@activity.participations))
  end

  def show
    render_success ParticipationEntity.represent(@participation)
  end

  def create
    @participation = Participation.find_or_initialize_by(activity: @activity, user: current_user)
    if @participation.update(canceled_at: nil)
      render_success ParticipationEntity.represent(@participation)
    else
      render_error @participation.errors
    end
  end

  def destroy
    if @participation.update(canceled_at: Time.zone.now)
      render_success
    else
      render_error
    end
  end

  private

  def set_activity
    @activity = Activity.find params.require(:activity_id)
  end

  def set_participation
    @participation = Participation.find params.require(:id)
  end

  def participation_params
    params.require(:data).permit(:place, :begins_at, :duration, :description, :creator_id, :max_participants, :title)
  end
end
