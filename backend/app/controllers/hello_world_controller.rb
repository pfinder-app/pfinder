# frozen_string_literal: true

class HelloWorldController < ApplicationController
  def index
    render json: { data: 'Hello World' }
  end
end
