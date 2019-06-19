# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show update destroy]

  def index
    render_success(ActivityEntity.represent(Activity.all))
  end

  def show
    render_success ActivityEntity.represent(@activity)
  end

  def create
    @activity = Activity.new activity_params
    if @activity.save
      render_success ActivityEntity.represent(@activity)
    else
      render_error @activity.errors
    end
  end

  def update
    if @activity.update activity_params
      render_success ActivityEntity.represent(@activity)
    else
      render_error @activity.errors
    end
  end

  def destroy
    if @activity.destroy
      render_success
    else
      render_error
    end
  end

  private

  def set_activity
    @activity = Activity.find params.require(:id)
  end

  def activity_params
    params.require(:data).permit(:place, :begins_at, :duration, :description, :creator_id, :max_participants, :title)
  end
end
