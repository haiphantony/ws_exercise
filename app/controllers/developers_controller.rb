# frozen_string_literal: true

class DevelopersController < ApplicationController
  def index
    @developer_search_form = DeveloperSearchForm.new(search_params)
    @developers = @developer_search_form.search
  end

  private

  def search_params
    return {} if params[:developer_search_form].blank?
    params.require(:developer_search_form).permit(:language_id, :programming_language_id)
  end
end
