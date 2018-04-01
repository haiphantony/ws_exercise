# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeveloperSearchForm do
  describe '#search' do
    before do
      @developer = create(:developer, email: 'phanthanhhai07t1@gmail.com')
      @language = create(:language, code: 'en')
      @programming_language = create(:programming_language, name: 'ruby')
      @developer_language = create(:developer_language, developer_id: @developer.id, language_id: @language.id)
      @developer_programming_language = create(:developer_programming_language, developer_id: @developer.id,
                                                                                programming_language_id: @programming_language.id)
    end

    context 'no select params' do
      it 'returns all developer has create data' do
        form = DeveloperSearchForm.new
        expect(form.search.size).to eq(1)
      end
    end
    context 'with param language' do
      it 'correct language' do
        form = DeveloperSearchForm.new(language_id: @language.id)
        expect(form.search.size).to eq(1)
      end
      it 'incorrect language' do
        form = DeveloperSearchForm.new(language_id: 2)
        expect(form.search.size).to eq(0)
      end
    end
    context 'with param programming_language' do
      it 'correct language programming' do
        form = DeveloperSearchForm.new(programming_language_id: @programming_language.id)
        expect(form.search.size).to eq(1)
      end
      it 'incorrect language programming' do
        form = DeveloperSearchForm.new(programming_language_id: 2)
        expect(form.search.size).to eq(0)
      end
    end

    context 'select all language and programming language' do
      it 'correct language and incorrect programming' do
        form = DeveloperSearchForm.new(language_id: @language.id, programming_language_id: 2)
        expect(form.search.size).to eq(0)
      end
      it 'incorrect language and correct programming' do
        form = DeveloperSearchForm.new(language_id: 2, programming_language_id: @programming_language.id)
        expect(form.search.size).to eq(0)
      end
      it 'correct language and programming' do
        form = DeveloperSearchForm.new(language_id: @language.id, programming_language_id: @programming_language.id)
        expect(form.search.size).to eq(1)
      end
    end

    context 'with from full param invalid' do
      it 'returns user with exist screen_name' do
        form = DeveloperSearchForm.new(language_id: 4, programming_language_id: 10)
        expect(form.search.size).to eq(0)
      end
    end
  end
end
