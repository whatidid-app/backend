# frozen_string_literal: true

class Mutations::Auth::ResetPassword < Mutations::BaseMutation
  argument :password, String, required: true do
    description 'Password of the user.'
  end
  argument :passwordConfirmation, String, required: true do
    description 'Confirm password of the user.'
  end

  field :user, Types::UserType, null: true
  field :access_token, String, null: true
  field :token_type, String, null: true
  field :client, String, null: true
  field :expiry, String, null: true
  field :uid, String, null: true
  field :errors, [String], null: true

  def resolve(**args)
    authorize current_user, :reset_password?
    current_user.update(args)
    auth = current_user.create_new_auth_token
    {
      access_token: auth['access-token'],
      token_type: auth['token-type'],
      client: auth['client'],
      expiry: auth['expiry'],
      uid: auth['uid'],
      user: current_user
    }
  rescue StandardError
    {
      errors: current_user&.errors&.full_messages
    }
  end
end
