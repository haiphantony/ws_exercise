# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Developer search', type: :system do
  before do
    @developer = create(:developer, email: 'phanthanhhai07t1@gmail.com')
    @language = create(:language, code: 'en')
    create(:language, code: 'vi')
    @programming_language = create(:programming_language, name: 'ruby')
    create(:programming_language, name: 'php')
    @developer_language = create(:developer_language, developer_id: @developer.id, language_id: @language.id)
    @developer_programming_language = create(:developer_programming_language, developer_id: @developer.id,
                                                                              programming_language_id: @programming_language.id)
  end
  it 'proceeds to search first load page' do
    visit root_path
    expect(page).to have_content 'List developers'
    expect(page).to have_content('phanthanhhai07t1@gmail.com')
  end
  it 'proceeds to search no select language and programming language' do
    visit developers_path
    expect(page).to have_content 'List developers'
    click_on 'Search'
    expect(page).to have_content('phanthanhhai07t1@gmail.com')
  end
  it 'proceeds to search correct language and no select programming language' do
    visit developers_path
    expect(page).to have_content 'List developers'
    select 'en', from: 'developer_search_form_language_id'
    click_on 'Search'
    expect(page).to have_content('phanthanhhai07t1@gmail.com')
  end
  it 'proceeds to search no select language and correct programming language' do
    visit developers_path
    expect(page).to have_content 'List developers'
    select 'ruby', from: 'developer_search_form_programming_language_id'
    click_on 'Search'
    expect(page).to have_content('phanthanhhai07t1@gmail.com')
  end
  it 'proceeds to search incorrect language and incorrect programming language' do
    visit developers_path
    expect(page).to have_content 'List developers'
    select 'php', from: 'developer_search_form_programming_language_id'
    select 'en', from: 'developer_search_form_language_id'
    click_on 'Search'
    expect(page).to have_no_content('phanthanhhai07t1@gmail.com')
  end
end
# rubocop:enable
