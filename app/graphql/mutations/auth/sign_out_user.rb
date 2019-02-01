# frozen_string_literal: true

class Mutations::Auth::SignOutUser < Mutations::BaseMutation
  argument :client, String, required: true do
    description 'Email of the user.'
  end
  argument :uid, String, required: true do
    description 'Password of the user.'
  end

  field :success, Boolean, null: true

  def resolve(uid:, client:)
    current_user = context[:current_user]
    if current_user.email == uid && current_user.tokens[client].present?
      current_user.tokens.delete(client)
      current_user.save!
      RecursiveOpenStruct.new(success: true)
    else
      RecursiveOpenStruct.new(success: false)
    end
  end
end
