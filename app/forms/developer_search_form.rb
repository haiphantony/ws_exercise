# frozen_string_literal: true

class DeveloperSearchForm
  include Virtus.model
  include ActiveModel::Model

  attribute :email, String
  attribute :language_id, Integer
  attribute :programming_language_id, Integer

  def search
    query = Developer.includes(:languages,
                               :programming_languages)

    query = query.where(languages: { id: language_id }) if language_id.present?

    query = query.where(programming_languages: { id: programming_language_id }) if programming_language_id.present?

    query.order(created_at: :desc)
  end
end
