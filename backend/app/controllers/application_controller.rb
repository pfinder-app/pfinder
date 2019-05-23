# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize!

  def authorize!
    render_error({ message: 'Not authorized' }, :unauthorized) unless current_user
  end

  def current_user
    @current_user ||= auth_token.presence && User.find_by(token: auth_token)
  end

  def auth_token
    @auth_token ||= request.headers['Authorization']&.split(' ')&.last
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error({ message: e.message }, :not_found)
  end

  rescue_from ActiveRecord::InvalidForeignKey,
              ActiveRecord::RecordInvalid, ActiveRecord::Rollback,
              ActionController::ParameterMissing do |e|
    render_error({ message: e.message }, :unprocessable_entity)
  end

  def render_success(data = nil, status = :ok)
    return head status unless data

    render json: { data: data }, status: status
  end

  def render_error(errors = nil, status = :bad_request)
    return head status unless errors

    render json: { errors: errors }, status: status
  end
end
