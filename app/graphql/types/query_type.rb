# frozen_string_literal: true

class Types::QueryType < Types::BaseObject
  # TODO: remove me
  field :users, [Types::UserType], null: false,
                             description: 'An example field added by the generator'
  def users
    User.all
  end
end
