# frozen_string_literal: true

class Mutations::BaseMutation < GraphQL::Schema::RelayClassicMutation
  include Pundit

  def current_user
    context[:current_user]
  end
end
