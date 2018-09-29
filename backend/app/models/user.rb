# frozen_string_literal: true

class User < ApplicationRecord
  enum canton: %i[zh be sgarai]
end
