# frozen_string_literal: true

class Resolvers::BaseResolver < GraphQL::Schema::Resolver
  include Pundit

  def current_user
    context[:current_user]
  end
end

