# frozen_string_literal: true

class ApplicationController < ActionController::API
  def show
    render json: { test: 'tw' }
  end
end
