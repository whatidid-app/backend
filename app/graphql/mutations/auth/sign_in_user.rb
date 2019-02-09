# frozen_string_literal: true

class Mutations::Auth::SignInUser < Mutations::BaseMutation
  argument :email, String, required: true do
    description 'Email of the user.'
  end
  argument :password, String, required: true do
    description 'Password of the user.'
  end

  field :user, Types::UserType, null: true
  field :access_token, String, null: true
  field :token_type, String, null: true
  field :client, String, null: true
  field :expiry, String, null: true
  field :uid, String, null: true
  field :errors, [String], null: true

  def resolve(email:, password:)
    user = User.where(email: email).first

    if user&.valid_password?(password)
      auth = user.create_new_auth_token
      {
        access_token: auth['access-token'],
        token_type: auth['token-type'],
        client: auth['client'],
        expiry: auth['expiry'],
        uid: auth['uid'],
        user: user
      }
    else
      {
        errors: ['Invalid Credentials']
      }
    end
  end
end
