class MeController < ApplicationController
  before_action :authorize!, except: %i[create]
  before_action :set_user, only: %i[index update]

  def index
    render_success UserEntity.represent(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render_success UserEntity.represent(@user)
    else
      render_error @user.errors
    end
  end

  def update
    if @user.update(user_params)
      render_success UserEntity.represent(@user)
    else
      render_error @user.errors
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:data).permit(:name, :scoutname, :scoutgroup, :canton, :birthdate, :email)
  end
end
