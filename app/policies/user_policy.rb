# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def reset_password?
    user.present?
  end
end
