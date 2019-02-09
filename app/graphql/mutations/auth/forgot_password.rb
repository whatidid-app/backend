# frozen_string_literal: true

class Mutations::Auth::ForgotPassword < Mutations::BaseMutation
  argument :email, String, required: true do
    description 'Email of the user.'
  end

  field :success, Boolean, null: false
  field :errors, [String], null: true

  def resolve(email:)
    user = User.find_by(email: email)

    if user.present?
      user.send_reset_password_instructions
      { success: true }
    else
      { success: false, errors: ['No Email Found'] }
    end
  end
end
