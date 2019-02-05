# frozen_string_literal: true

class UserTeam < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :team
end
