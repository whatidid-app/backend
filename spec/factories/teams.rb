FactoryBot.define do
  factory :team do
    name { 'Squad Goals' }
    slug { SecureRandom.alphanumeric(6) }
  end
end
