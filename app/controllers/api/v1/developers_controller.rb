# frozen_string_literal: true

module Api
  module V1
    class DevelopersController < Api::BaseController
      before_action :set_post, only: %i[show]
      def show
        # rubocop:disable Style/GuardClause
        if stale?(last_modified: @developer.updated_at.utc)
          cache_options = { compress: true, expires_in: 24.hours, race_condition_ttl: 10 }
          Rails.cache.fetch("#{@developer.cache_key}/#{__method__}", cache_options) do
            render json: @developer, include: %i[languages programming_languages]
          end
        end
        # rubocop:enable Style/GuardClause
      end

      private

      def set_post
        @developer = Developer.find(params[:id])
      end
    end
  end
end
