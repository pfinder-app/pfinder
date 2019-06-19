# frozen_string_literal: true

class ParticipationsController < ApplicationController
  before_action :set_participation, only: %i[show update destroy]
  before_action :set_activity, only: %i[index create new]

  def index
    render_success(ParticipationEntity.represent(@activity.participations))
  end

  def show
    render_success ParticipationEntity.represent(@participation)
  end

  def create
    @participation = @activity.participations.new participation_params
    if @participation.save
      render_success ParticipationEntity.represent(@participation)
    else
      render_error @participation.errors
    end
  end

  def update
    if @participation.update participation_params
      render_success ParticipationEntity.represent(@participation)
    else
      render_error @participation.errors
    end
  end

  def destroy
    if @participation.destroy
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
