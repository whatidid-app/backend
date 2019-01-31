# frozen_string_literal: true

class Mutations::CreateUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :name, String, required: true
  argument :password, String, required: true

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(**args)
    user = User.new(args)
    if user.save
      {
        user: user,
        errors: []
      }
    else
      {
        user: user,
        errors: user.errors.full_messages
      }
    end
  end
end
