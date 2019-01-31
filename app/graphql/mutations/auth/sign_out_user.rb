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
    user = User.find_by(email: uid)
    if user && client && user.tokens[client]
      user.tokens.delete(client)
      user.save!
      RecursiveOpenStruct.new(success: true)
    else
      RecursiveOpenStruct.new(success: false)
    end
  end
end
