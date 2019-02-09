# frozen_string_literal: true

class Types::QueryType < Types::BaseObject
  field :users, Types::UserConnectionType, function: Resolvers::SearchUsers, connection: true
  field :user, resolver: Resolvers::FindUser
  field :viewer, resolver: Resolvers::Viewer
end
