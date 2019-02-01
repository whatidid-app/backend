# frozen_string_literal: true

class Resolvers::SearchUsers < Resolvers::BaseSearchResolver
  scope { User.all }

  option :name, type: types.String, with: :apply_name_filter
  option :email, type: types.String, with: :apply_email_filter

  def apply_name_filter(scope, value)
    scope.where 'name ILIKE ?', escape_search_term(value)
  end

  def apply_email_filter(scope, value)
    scope.where 'email ILIKE ?', escape_search_term(value)
  end
end
