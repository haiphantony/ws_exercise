# frozen_string_literal: true

class DeveloperSerializer < ActiveModel::Serializer
  attributes :id, :email
  has_many :developer_languages
  has_many :languages, through: :developer_languages

  has_many :developer_programming_languages
  has_many :programming_languages, through: :developer_programming_languages
end
