# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Test Testerson' }
    email { 'example@gmail.com' }
    password { 'sample_password' }
  end
end
