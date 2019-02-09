# frozen_string_literal: true

class Types::CompanyStatusEnum < Types::BaseEnum
  description 'Company Status'

  value 'ACTIVE', 'Active', value: 'active'
  value 'ARCHIVED', 'Archived', value: 'active'
end
