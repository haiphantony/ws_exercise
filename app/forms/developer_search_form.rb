# frozen_string_literal: true

class DeveloperSearchForm
  include Virtus.model
  include ActiveModel::Model

  attribute :email, String
  attribute :language_id, Integer
  attribute :programming_language_id, Integer

  def search
    query = Developer.all
    query = query.joins(:developer_languages).where(developer_languages: { language_id: language_id }) if language_id.present?
    if programming_language_id.present?
      query = query.joins(:developer_programming_languages)
                   .where(developer_programming_languages: { programming_language_id: programming_language_id })
    end
    query.order(created_at: :desc)
  end
end
