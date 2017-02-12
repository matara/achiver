require 'achiever/domain/goal'
require 'achiever/repositories/goal_repository'

module Achiever
  module Commands
    class CreateGoal

      CHECK_PERIOD = %w[daily 3days weekly monthly]

      # title - String
      # deadline - Date
      # check_period - String from CHECK_PERIOD
      def initialize(title:, deadline:, check_period:, repository:)
        @title = title
        @deadline = deadline
        @check_period = check_period
        @repository = repository
      end

      def perform
        @repository.store(create_domain_model)
      end

      private
      def create_domain_model
        Achiever::Domain::Goal.new(title: @title, deadline: @deadline, check_period: @check_period)
      end

    end
  end
end
