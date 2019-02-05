FactoryBot.define do
  factory :invite do
    email { 'test@gmail.com' }
    token { SecureRandom.alphanumeric(16) }
    team
  end
end
