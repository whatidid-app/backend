# frozen_string_literal: true

class Types::UserConnectionType < GraphQL::Types::Relay::BaseConnection
  edge_type(Types::UserEdgeType)

  field :total_count, Integer, null: false
  def total_count
    # - `object` is the Connection
    # - `object.nodes` is the collection of Users
    object.nodes.size
  end
end
