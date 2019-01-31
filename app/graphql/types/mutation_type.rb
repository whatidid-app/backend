# frozen_string_literal: true

class Types::MutationType < Types::BaseObject
  field :create_user, mutation: Mutations::CreateUser
  field :register_user, mutation: Mutations::Auth::RegisterUser
  field :forgot_password, mutation: Mutations::Auth::ForgotPassword
  field :reset_password, mutation: Mutations::Auth::ResetPassword
  field :sign_in_user, mutation: Mutations::Auth::SignInUser
  field :sign_out_user, mutation: Mutations::Auth::SignOutUser
end
