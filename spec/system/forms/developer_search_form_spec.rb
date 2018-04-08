# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Developer search', type: :system do
  before do
    @language = create(:language)
    @programming_language = create :programming_language
    @developer = create(:developer)
    @developer_language = create :developer, languages: [@language]
    @developer_programming_language = create :developer,
                                             programming_languages: [@programming_language]
    @developer_language_programming = create :developer,
                                             languages: [@language],
                                             programming_languages: [@programming_language]
  end

  it 'show all rerords when load page' do
    visit root_path
    expect(page).to have_content(@developer.email)
  end

  it 'shows matched records when a language is specified' do
    visit developers_path
    select @language.code, from: 'developer_search_form[language_id]'
    click_on 'Search'
    expect(page).to have_content(@developer_language.email)
    expect(page).to have_select('developer_search_form[language_id]', selected: @language.code)
  end

  it 'shows matched records when a programming language is specified' do
    visit developers_path
    select @programming_language.name, from: 'developer_search_form[programming_language_id]'
    click_on 'Search'
    expect(page).to have_content(@developer_programming_language.email)
    expect(page).to have_select('developer_search_form[programming_language_id]', selected: @programming_language.name)
  end

  it 'shows matched records when language and programming language are specified' do
    visit developers_path
    select @language.code, from: 'developer_search_form[language_id]'
    select @programming_language.name, from: 'developer_search_form[programming_language_id]'
    click_on 'Search'
    expect(page).to have_content(@developer_language_programming.email)
    expect(page).to have_select('developer_search_form[language_id]', selected: @language.code)
    expect(page).to have_select('developer_search_form[programming_language_id]', selected: @programming_language.name)
  end
end
