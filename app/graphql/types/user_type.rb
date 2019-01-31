# frozen_string_literal: true

class Types::UserType < Types::BaseObject
  description 'user type'
  field :id, ID, null: false
  field :name, String, null: true
  field :email, String, null: false
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :deleted_at, Types::DateTimeType, null: true
end
