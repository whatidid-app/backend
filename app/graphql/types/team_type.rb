# frozen_string_literal: true

class Types::TeamType < Types::BaseObject
  description 'team type'

  field :id, ID, null: false
  field :name, String, null: true
  field :slug, String, null: false
  field :status, Types::CompanyStatusEnum, null: false
  field :created_at, Types::DateTimeType, null: false
  field :updated_at, Types::DateTimeType, null: false
  field :deleted_at, Types::DateTimeType, null: true
end
