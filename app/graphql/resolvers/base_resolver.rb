# frozen_string_literal: true

class Resolvers::BaseResolver < GraphQL::Schema::Resolver
  include Pundit
end

