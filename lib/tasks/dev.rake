# frozen_string_literal: true

namespace :dev do
  require 'factory_bot_rails'
  require 'faker'
  desc 'rake task'
  task :generate_data, [:number] => :environment do |_, args|
    @args = {}
    @args[:number] = (args.number || 1).to_i
    language_codes = %w[vn en fr jp]
    programming_language_names = %w[ruby php java javascript pithon nodejs]
    @args[:number].times do
      email = loop do
        email = Faker::Internet.email
        break email unless Developer.exists?(email: email)
      end
      developer = FactoryBot.create(:developer, email: email)
      languages = language_codes.sample(rand(4))
      languages.each do |lang|
        language = Language.find_or_create_by(code: lang)
        DeveloperLanguage.find_or_create_by(developer_id: developer.id, language_id: language.id)
      end

      programming_languages = programming_language_names.sample(rand(6))
      programming_languages.each do |prg|
        program = ProgrammingLanguage.find_or_create_by(name: prg)
        DeveloperProgrammingLanguage.find_or_create_by(developer_id: developer.id, programming_language_id: program.id)
      end
    end
  end
end
