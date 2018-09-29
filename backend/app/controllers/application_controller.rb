class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error({ message: e.message }, :not_found)
  end

  rescue_from ActiveRecord::Rollback do |e|
    render_error({ message: e.message }, :unprocessable_entity)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render_error({ message: e.message }, :unprocessable_entity)
  end

  rescue_from ActiveRecord::InvalidForeignKey do |e|
    render_error({ message: e.message }, :unprocessable_entity)
  end

  rescue_from ActionController::ParameterMissing do |e|
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
