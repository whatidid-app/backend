Devise.setup do |config|
  config.mailer = 'UserMailer'
  config.password_length = 8..128
   # Allow unconfirmed users.
  config.allow_unconfirmed_access_for = 14.days
end