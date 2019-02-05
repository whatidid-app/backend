# frozen_string_literal: true

class Invite < ApplicationRecord
  belongs_to :team

  before_create :create_token

  private

  def create_token
    while token.nil?
      token = SecureRandom.alphanumeric(16)

      self.token = token if Invite.find_by(token: token).nil?
    end
  end
end
