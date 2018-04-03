# frozen_string_literal: true

class LanguageSerializer < ActiveModel::Serializer
  attributes :id, :code

  has_many :developer_languages
  has_many :developers, through: :developer_languages
end
