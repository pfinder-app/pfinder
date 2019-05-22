# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    render_success(UserEntity.represent(User.all))
  end

  def show
    render_success UserEntity.represent(@user)
  end

  def create
    @user = User.new user_params
    if @user.save
      render_success UserEntity.represent(@user)
    else
      render_error @user.errors
    end
  end

  def update
    if @user.update user_params
      render_success UserEntity.represent(@user)
    else
      render_error @user.errors
    end
  end

  def destroy
    if @user.destroy
      render_success
    else
      render_error
    end
  end

  private

  def set_user
    @user = User.find params.require(:id)
  end

  def user_params
    params.require(:data).permit(:name, :scoutname, :scoutgroup, :canton, :birthdate)
  end
end
