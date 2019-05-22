# frozen_string_literal: true

class UserEntity < Grape::Entity
  expose :id, :name, :scoutname, :birthdate, :canton, :scoutgroup
end
