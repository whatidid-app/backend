# frozen_string_literal: true

class Team < ApplicationRecord
  acts_as_paranoid

  has_many :user_teams
  has_many :users, through: :user_teams

  before_create :create_slug

  enum status: { active: 0, archived: 1 }

  private

  def create_slug
    while slug.nil?
      slug = SecureRandom.alphanumeric(6)

      self.slug = slug if Team.find_by(slug: slug).nil?
    end
  end
end
