# frozen_string_literal: true

class ProgrammingLanguageSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :developer_programming_languages
  has_many :developer, through: :developer_programming_languages
end
