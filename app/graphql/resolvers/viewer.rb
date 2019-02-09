# frozen_string_literal: true

class Resolvers::Viewer < Resolvers::BaseResolver
  type Types::UserType, null: true

  def resolve
    current_user
  end
end
