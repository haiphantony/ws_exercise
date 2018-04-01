# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create language

Language.destroy_all
Language.create([{ code: 'vn' }, { code: 'en' }, { code: 'ja' }])
p "Created #{Language.count} language"

#create programming_languages

ProgrammingLanguage.destroy_all
ProgrammingLanguage.create([
	{
		name: 'ruby'
	},
	{
		name: 'javascript'
	},
	{
		name: 'php'
	},
	{
		name: 'pithon'
	},
	{
		name: 'kotlin'
	}
])

