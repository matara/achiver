require 'achiever/domain/goal'
require 'achiever/repositories/goal_repository'
require 'achiever/factories/goal_factory'

module Achiever
  module Factories
    class GoalFactory

      def self.build(**attributes)
        Achiever::Domain::Goal.new(goal_defaults.merge(attributes))
      end

      def self.create(**attributes)
        goal = self.build(**attributes)
        Achiever::Repositories::GoalRepository.new.store(goal)
        goal
      end

      private

      def self.goal_defaults
        {
            title: Faker::Lorem.word,
            deadline: Date.today + 1,
            check_period: Achiever::Commands::CreateGoal::CHECK_PERIOD.sample
        }
      end

    end
  end
end
