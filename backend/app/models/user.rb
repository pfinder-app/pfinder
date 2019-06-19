# frozen_string_literal: true

class User < ApplicationRecord
  enum canton: %i[zh be sgarai]

  before_create :generate_token

  has_many :activities, inverse_of: :creator, foreign_key: :creator_id, dependent: :restrict_with_error

  validates :email, format: { with: /\A\S+@.+\.\S+\z/ }, presence: true, uniqueness: true
  validates :scoutname, presence: true

  def generate_token
    self.token = SecureRandom.urlsafe_base64(64)
    generate_token if self.class.exists?(token: token)
  end
end
